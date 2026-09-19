typedef enum {
    PLAYER_CHARACTER,
    UNK_ENTITY_1,
    UNK_ENTITY_2,
    UNK_ENTITY_3,
    UNK_ENTITY_4,
    UNK_ENTITY_5,
    UNK_ENTITY_6,
    UNK_ENTITY_7,
    UNK_ENTITY_8,
    UNK_ENTITY_10 = 0x10,
    UNK_ENTITY_13 = 0x13,
    UNK_ENTITY_51 = 0x51, // SubWeapons container falling liquid
    UNK_ENTITY_100 = 0x100
} EntityTypes;

#define PLAYER g_Entities[PLAYER_CHARACTER]

#define SQ(x) ((x) * (x))
#define ABS(x) ((x) < 0 ? -(x) : (x))
#define ABS_ALT(x) ((x) >= 0 ? (x) : -(x))
#define DECR(x) ((x) == 0 ? 0 : --(x))

#define CLAMP(min, max, x)    \
    if ((x) < (min)) {        \
        (x) = (min);          \
    } else if ((x) > (max)) { \
        (x) = (max);          \
    }

#define ARRAY_COUNT(arr) (s32)(sizeof(arr) / sizeof(arr[0]))
#define ARRAY_COUNTU(arr) (u32)(sizeof(arr) / sizeof(arr[0]))
