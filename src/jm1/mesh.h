#ifndef _MESH_H
#define _MESH_H

#include "common.h"
#include <libgpu.h>

typedef struct {
    u8 v0, v1, v2, v3;
    u16 flags0, flags1;
    u32 unk0; // these are color and texture stuff
    u32 unk1;
    u16 unk2, unk3, unk4, unk5;
    u32 command; // texwindow
} Face;

// mesh data
// 32 count-1
// header: [16 offset 16 something]*count

typedef struct {
    u32 count; // one less
    SVECTOR data[];
} VertList;

typedef struct {
    u16 verts_offset; // verts
    u16 faces_offset; // faces
} MeshSetHeader;

// This is a MeshSet, isn't it?
typedef struct {
    u32 sets_count; // Count less one
    u32 data[];
    // MeshSetHeader sets_headers[sets_count+1];
    // MeshSet sets[sets_count+1];
} MeshSets;

typedef struct {
    s16 a, b;
    VertList *verts;

    struct {
        u32 count; // one less
        u32 data[];
    } *unk1;

    // Points to the `sets_count` field of the mesh data.
    MeshSets *sets_data;
} Mesh;

#endif // _MESH_H
