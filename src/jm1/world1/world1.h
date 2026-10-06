#pragma once

#include "../all.h"
#include "../entity.h"
#include "../level.h"
#include "../math.h"
#include "../physics.h"
#include "../renderer.h"
#include "../sound.h"

enum {
    E_FROG = 0,
    E_KIWI = 1,
};

#define SFX_DEATH_VOLUME 100

enum {
    SFX_ENEMY_DEATH = 0x2400,
};

extern MeshMetadata D_80103164[8];
extern MeshMetadata D_8010350C[3];
extern MeshMetadata D_8010353C[1];
