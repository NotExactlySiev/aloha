#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

#define countof(arr) (int)(sizeof(arr) / sizeof(*arr))

int output_file_open(char *path)
{
    return open(path, O_RDWR | O_CREAT, 0644);
}

void *output_file_map(int fd, size_t size)
{
    int rc = ftruncate(fd, size);
    if (rc == -1) {
        printf("ftruncate error: %s %d\n", strerror(errno), errno);
        exit(1);
    }

    void *ret = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (ret == MAP_FAILED) {
        printf("mmap error: %s %d\n", strerror(errno), errno);
        exit(1);
    }
    return ret;
}

int ear_extract(const void *data, size_t size, char *output_path)
{
    // TODO
}

int pex_compress(const void *data, size_t size, char *output_path);
int pex_decompress(const void *data, size_t size, char *output_path);

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

FileType *get_file_type(char *name)
{
    for (int i = 0; i < countof(file_types); i++) {
        if (strcmp(name, file_types[i].name) == 0) {
            return &file_types[i];
        }
    }

    return NULL;
}

Command *get_command(FileType *ft, char *name)
{
    for (Command *cmd = &ft->commands[0]; cmd->name != NULL; cmd++) {
        if (strcmp(name, cmd->name) == 0) {
            return cmd;
        }
    }

    return NULL;
}

const char *program_name = "Exact-O-Knife";
const char *executable_name = "knife";
const char *usage_string = "<file type> <command> <input file>";

void print_usage(void)
{
    printf("%s\nUsage: %s %s\n\n", program_name, executable_name, usage_string);
}

int map_file(char *path, void **out_data, size_t *out_size)
{
    int fd = open(path, O_RDONLY);
    struct stat st;
    fstat(fd, &st);
    size_t size = st.st_size;
    void *p = mmap(NULL, size, PROT_READ, MAP_PRIVATE, fd, 0);
    if (!p) {
        return -1;
    }

    *out_data = p;
    *out_size = size;
    return 0;
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

    void *input_data;
    size_t input_size;
    int rc = map_file(input_path, &input_data, &input_size);
    if (rc < 0) {
        printf("mmap error\n");
        exit(1);
    }

    if (argc == 4) {
        print_usage();
        printf("Provide output file.\n");
        exit(1);
    }

    char *output_path = argv[4];
    // FILE *output_file = fopen(output_path, "w");
    // if (!output_file) {
    //     printf("can't open output file\n");
    //     exit(1);
    // }

    rc = command->func(input_data, input_size, output_path);
    if (rc < 0) {
        printf("command failed with code %d\n", rc);
        exit(1);
    }

    // fclose(output_file);

    return 0;

    // FILE *outfile;
    // int command;

    // if (strcmp(*argv, "decomp") == 0)
    //     command = COM_DECOMPRESS;
    // else if (strcmp(*argv, "comp") == 0)
    //     command = COM_COMPRESS;
    // else {
    //     printf(USAGE);
    //     return -1;
    // }

    // infile = fopen(*argv++, "r");
    // if (!infile) {
    //     printf("FUCK\n");
    //     return -1;
    // }

    //

    // switch (command) {
    // case COM_DECOMPRESS:
    //     decompress_file(infile, outfile);
    //     break;
    // case COM_COMPRESS:
    //     compress_file(infile, outfile);
    //     break;
    // }

    // fclose(infile);
    // fclose(outfile);

    // return 0;
}
