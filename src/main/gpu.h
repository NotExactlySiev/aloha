#pragma once

void gpu_init(void);
void call_ResetGraph(int mode);
int call_SetGraphDebug(int level);
void call_SetDispMask(int mask);
void wait_frame(void);
