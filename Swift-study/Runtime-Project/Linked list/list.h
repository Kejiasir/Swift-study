//
//  list.h
//  Runtime-Project
//
//  Created by Yi Qing on 2018/5/9.
//  Copyright © 2018年 Arvin. All rights reserved.
//

#ifndef list_h
#define list_h

typedef struct ListElmt_ {
    void *data;
    struct ListElmt_ *next;
} ListElmt;

typedef struct List_ {
    int size;
    int (*match) (const void *key1, const void *key2);
    void (*destroy) (void *data);
    ListElmt *head;
    ListElmt *tail;
} List;

void list_init (List *list, void (*destroy) (void *data));
void list_destroy (List *list);
int list_ins_next (List *list, ListElmt *element, const void *data);
int list_rem_next (List *list, ListElmt *element, void **data);

int list_size (const List *list);
ListElmt *list_head (const List *list);
ListElmt *list_tail (const List *list);

int list_is_head (const ListElmt *element);
int list_is_tail (const ListElmt *element);

void list_data (const ListElmt *element);
ListElmt *list_next (const ListElmt *element);

#define list_size (list) ((list) -> size)
#define list_head (list) ((list) -> head)
#define list_tail (list) ((list) -> tail)

#define list_is_head (list, element) ((element) == (list) ->head ? 1 : 0)
#define list_is_tail (element) ((element) ->next == NULL ? 1 : 0)

#define list_data (element) ((element) -> data)
#define list_next (element) ((element) -> next)

#endif /* list_h */

