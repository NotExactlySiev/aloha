#include "common.h"
#include <libcd.h>
#include <libgpu.h>

#include "movie_args.h"

int play_movie_str(char *filename, MovieArgs *args, int (*cb)(void));