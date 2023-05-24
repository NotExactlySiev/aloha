
#include "common.h"

typedef struct {
	short x, y;		/* offset pos32 on VRAM */
	short w, h;		/* width and height */
} RECT;

typedef struct {
	s32 x, y;		/* offset pos32 on VRAM */
	s32 w, h;		/* width and height */
} RECT32;

/*
 * Environment 
 */
typedef struct {
	u32	tag;
	u32	code[15];
} DR_ENV;				/* Packed Drawing Environment */
	       
typedef struct {
	RECT	clip;		/* clip area */
	short	ofs[2];		/* drawing offset */
	RECT	tw;		/* texture window */
	u16 tpage;		/* texture page */	
	u8	dtd;		/* dither flag (0:off, 1:on) */
	u8	dfe;		/* flag to draw on display area (0:off 1:on) */
	u8	isbg;		/* enable to auto-clear */
	u8	r0, g0, b0;	/* initital background color */
	DR_ENV	dr_env;		/* reserved */
} DRAWENV;
	       
typedef struct {
	RECT	disp;		/* display area */
	RECT	screen;		/* display start pos32 */
	u8	iss32er;	/* s32erlace 0: off 1: on */
	u8	isrgb24;	/* RGB24 bit mode */
	u8	pad0, pad1;	/* reserved */
} DISPENV;


typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	short	x1,	y1;
	short	x2,	y2;
} POLY_F3;				/* Flat Triangle */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	short	x1,	y1;
	short	x2,	y2;
	short	x3,	y3;
} POLY_F4;				/* Flat Quadrangle */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	u8	u0, v0;	u16	clut;
	short	x1,	y1;
	u8	u1, v1;	u16	tpage;
	short	x2,	y2;
	u8	u2, v2;	u16	pad1;
} POLY_FT3;				/* Flat Textured Triangle */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	u8	u0, v0;	u16	clut;
	short	x1,	y1;
	u8	u1, v1;	u16	tpage;
	short	x2,	y2;
	u8	u2, v2;	u16	pad1;
	short	x3,	y3;
	u8	u3, v3;	u16	pad2;
} POLY_FT4;				/* Flat Textured Quadrangle */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	u8	r1, g1, b1, pad1;
	short	x1,	y1;
	u8	r2, g2, b2, pad2;
	short	x2,	y2;
} POLY_G3;				/* Gouraud Triangle */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	u8	r1, g1, b1, pad1;
	short	x1,	y1;
	u8	r2, g2, b2, pad2;
	short	x2,	y2;
	u8	r3, g3, b3, pad3;
	short	x3,	y3;
} POLY_G4;				/* Gouraud Quadrangle */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	u8	u0, v0;	u16	clut;
	u8	r1, g1, b1, p1;
	short	x1,	y1;
	u8	u1, v1;	u16	tpage;
	u8	r2, g2, b2, p2;
	short	x2,	y2;
	u8	u2, v2;	u16	pad2;
} POLY_GT3;				/* Gouraud Textured Triangle */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	u8	u0, v0;	u16	clut;
	u8	r1, g1, b1, p1;
	short	x1,	y1;
	u8	u1, v1;	u16	tpage;
	u8	r2, g2, b2, p2;
	short	x2,	y2;
	u8	u2, v2;	u16	pad2;
	u8	r3, g3, b3, p3;
	short	x3,	y3;
	u8	u3, v3;	u16	pad3;
} POLY_GT4;				/* Gouraud Textured Quadrangle */

/*
 * Line Primitive Definitions
 */
typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	short	x1,	y1;
} LINE_F2;				/* Unconnected Flat Line */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	u8	r1, g1, b1, p1;
	short	x1,	y1;
} LINE_G2;				/* Unconnected Gouraud Line */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	short	x1,	y1;
	short	x2,	y2;
	u32	pad;
} LINE_F3;				/* 2 connected Flat Line */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	u8	r1, g1, b1, p1;
	short	x1,	y1;
	u8	r2, g2, b2, p2;
	short	x2,	y2;
	u32	pad;
} LINE_G3;				/* 2 connected Gouraud Line */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	short	x1,	y1;
	short	x2,	y2;
	short	x3,	y3;
	u32	pad;
} LINE_F4;				/* 3 connected Flat Line Quadrangle */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	u8	r1, g1, b1, p1;
	short	x1,	y1;
	u8	r2, g2, b2, p2;
	short	x2,	y2;
	u8	r3, g3, b3, p3;
	short	x3,	y3;
	u32	pad;
} LINE_G4;				/* 3 connected Gouraud Line */

/*
 * Sprite Primitive Definitions
 */
typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	u8	u0, v0;	u16	clut;
	short	w,	h;
} SPRT;					/* free size Sprite */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	u8	u0, v0;	u16	clut;
} SPRT_16;				/* 16x16 Sprite */
	       
typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	u8	u0, v0;	u16	clut;
} SPRT_8;				/* 8x8 Sprite */
	       
/*
 * Tile Primitive Definitions
 */
typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
	short	w,	h;
} TILE;					/* free size Tile */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
} TILE_16;				/* 16x16 Tile */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
} TILE_8;				/* 8x8 Tile */

typedef struct {
	u32	tag;
	u8	r0, g0, b0, code;
	short	x0, 	y0;
} TILE_1;				/* 1x1 Tile */

/*
 *  Special Primitive Definitions
 */
typedef struct {
	u32	tag;
	u32	code[2];
} DR_MODE;				/* Drawing Mode */

typedef struct {
	u32	tag;
	u32	code[2];
} DR_TWIN;				/* Texture Window */
	       
typedef struct {
	u32	tag;
	u32	code[2];
} DR_AREA;				/* Drawing Area */
	       
typedef struct {
	u32	tag;
	u32	code[2];
} DR_OFFSET;				/* Drawing Offset */
	       
typedef struct {			/* MoveImage */
	u32	tag;
	u32	code[5];
} DR_MOVE;

typedef struct {			/* LoadImage */
	u32	tag;
	u32	code[3];
	u32	p[13];
} DR_LOAD;

typedef	struct {
	u32	tag;
	u32	code[1];
} DR_TPAGE;				/* Drawing TPage */

typedef struct {
        u32  tag;
        u32  code[2];
} DR_STP;                               /* Drawing STP */
