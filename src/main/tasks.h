typedef void (*TaskFunc)(void);

int tasks_add(TaskFunc fn, short interval);
int tasks_add_reserved(TaskFunc fn, short interval);
void tasks_remove(int handle);
void tasks_remove_reserved(int handle);
void tasks_set_enabled(int val);
void tasks_tick(void);