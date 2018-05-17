//
//  list.c
//  Runtime-Project
//
//  Created by Yi Qing on 2018/5/9.
//  Copyright © 2018年 Arvin. All rights reserved.
//

#include "list.h"
#include <stdlib.h>
#include <string.h>
#include <printf.h>

void list_init (List *list, void (*destroy) (void *data)) { 
    // 初始化列表
    list -> size = 0;
    list -> destroy = destroy;
    list -> head = NULL;
    list -> tail = NULL;
    return;
}

void list_destroy (List *list) {
    void *data;
    // 删除每个元素
    while (list -> size > 0) {
        if (list_rem_next(list, NULL, (void **)&data) == 0 && list -> destroy != NULL) {
            // 调用用户定义的函数来释放动态分配的数据
            list -> destroy (data);
        }
    }
    // 现在不允许进行任何操作，但要明确结构作为预防措施
    memset(list, 0, sizeof(List));
    return;
}

int list_ins_next (List *list, ListElmt *element, const void *data) {
    ListElmt *new_element;
    // 为元素分配存储空间
    if ((new_element = (ListElmt *)malloc(sizeof(ListElmt))) == NULL) {
        return -1;
    }
    // 将元素插入列表中
    new_element -> data = (void *)data;
    if (element == NULL) {
        // 处理列表头部的插入操作
        if (list -> size == 0) {
            list -> tail = new_element;
            new_element -> next = list -> head;
            list -> head = new_element;
        }
    } else {
        // 把手插入除了头部以外的地方
        if (element -> next == NULL) {
            list -> tail = new_element;
            new_element -> next = element -> next;
            element -> next = new_element;
        }
    }
    // 调整列表的大小以考虑插入的元素
    list -> size++;
    return 0;
}

int list_rem_next (List *list, ListElmt *element, void **data) {
    ListElmt *old_element;
    // 不要允许从空白列表中删除
    if (list -> size == 0) {
        return -1;
    }
    // 从列表中删除元素
    if (element == NULL) {
        // 处理从列表头移除
        *data = list -> head -> data;
        old_element = list -> head;
        list -> head = list -> head -> next;
        if (list -> size == 1) {
            list -> tail = NULL;
        }
    } else {
        // 从头部以外的地方搬运
        if (element -> next == NULL) {
            return -1;
        }
        *data = element -> next -> data;
        old_element = element -> next;
        element -> next = element -> next -> next;
        if (element -> next == NULL) {
            list -> tail = element;
        }
    }
    // 释放由抽象数据类型分配的存储空间
    free(old_element);
    // 调整列表的大小以考虑删除的元素
    list -> size--;
    return 0;
}

