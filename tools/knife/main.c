#include "utility.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define countof(arr) (int)(sizeof(arr) / sizeof(*arr))

int pex_compress(const void *data, size_t size, char *output_path);
int pex_decompress(const void *data, size_t size, char *output_path);
int ear_extract(const void *data, size_t size, char *output_path);

const char *program_name = "Exact-O-Knife";
const char *executable_name = "knife";
const char *usage_string = "<file type> <command> <input file>";

static void print_usage(void)
{
    printf("%s\nUsage: %s %s\n\n", program_name, executable_name, usage_string);
}

typedef struct {
    char *name;
    char *description;
    int (*func)(const void *data, size_t size, char *out);
} Command;

typedef struct {
    char *name;
    char *description;
    Command *commands;
} FileType;

FileType file_types[] = {
    {
        .name = "pex",
        .description = "Compressed Executable",
        .commands = (Command[]) {
            {
                .name = "decompress",
                .description = "Decompress into regular executable",
                .func = pex_decompress,
            },

            {
                .name = "compress",
                .description = "Compress executable into PEX",
                .func = pex_compress,
            },

            { 0 },
        },
    },
};

static FileType *get_file_type(char *name)
{
    for (int i = 0; i < countof(file_types); i++) {
        if (strcmp(name, file_types[i].name) == 0) {
            return &file_types[i];
        }
    }

    return NULL;
}

static Command *get_command(FileType *ft, char *name)
{
    for (Command *cmd = &ft->commands[0]; cmd->name != NULL; cmd++) {
        if (strcmp(name, cmd->name) == 0) {
            return cmd;
        }
    }

    return NULL;
}

int main(int argc, char *argv[])
{
    if (argc == 1) {
        print_usage();
        printf("Supported file types:\n");
        for (int i = 0; i < countof(file_types); i++) {
            FileType *ft = &file_types[i];
            printf("\t%s\t%s\n", ft->name, ft->description);
        }
        exit(0);
    }

    char *arg_file_type = argv[1];

    FileType *file_type = get_file_type(arg_file_type);
    if (file_type == NULL) {
        print_usage();
        printf("File type %s is not recognized.\n", arg_file_type);
        exit(1);
    }

    if (argc == 2) {
        print_usage();
        printf("Possible commands for %s:\n", file_type->name);
        FileType *ft = file_type;
        for (Command *cmd = &ft->commands[0]; cmd->name != NULL; cmd++) {
            printf("\t%s\t%s\n", cmd->name, cmd->description);
        }
        exit(0);
    }

    char *arg_command = argv[2];
    Command *command = get_command(file_type, arg_command);
    if (command == NULL) {
        print_usage();
        printf("Command %s for file type %s is not recognized.\n", arg_command, file_type->name);
        exit(1);
    }

    if (argc == 3) {
        print_usage();
        printf("Provide input file.\n");
        exit(1);
    }

    char *input_path = argv[3];


    size_t input_size;
    void *input_data = map_file_for_read(input_path, &input_size);

    if (argc == 4) {
        print_usage();
        printf("Provide output file.\n");
        exit(1);
    }

    char *output_path = argv[4];

    int rc = command->func(input_data, input_size, output_path);
    if (rc < 0) {
        printf("command failed with code %d\n", rc);
        exit(1);
    }

    return 0;
}
