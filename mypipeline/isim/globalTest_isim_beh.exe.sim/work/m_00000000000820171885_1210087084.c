/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/ISE project/mypipeline/mainCompenent.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {0, 0};
static int ng4[] = {14, 0};
static int ng5[] = {4, 0};
static unsigned int ng6[] = {2U, 0U};
static unsigned int ng7[] = {3U, 0U};
static unsigned int ng8[] = {4U, 0U};
static unsigned int ng9[] = {5U, 0U};



static void Always_229_0(char *t0)
{
    char t9[8];
    char t31[8];
    char t32[8];
    char t42[8];
    char t46[8];
    char t54[8];
    char t56[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t43;
    char *t44;
    char *t45;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t55;

LAB0:    t1 = (t0 + 3168U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(229, ng0);
    t2 = (t0 + 3488);
    *((int *)t2) = 1;
    t3 = (t0 + 3200);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(229, ng0);

LAB5:    xsi_set_current_line(231, ng0);
    t4 = (t0 + 1848U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB17;

LAB18:
LAB19:    goto LAB2;

LAB7:    xsi_set_current_line(232, ng0);
    t7 = (t0 + 1208U);
    t8 = *((char **)t7);
    t7 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t7, t8, 0, 0, 32, 0LL);
    goto LAB19;

LAB9:    xsi_set_current_line(233, ng0);

LAB20:    xsi_set_current_line(234, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng3)));
    memset(t9, 0, 8);
    t7 = (t4 + 4);
    t8 = (t3 + 4);
    t10 = *((unsigned int *)t4);
    t11 = *((unsigned int *)t3);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t7);
    t14 = *((unsigned int *)t8);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t7);
    t18 = *((unsigned int *)t8);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB24;

LAB21:    if (t19 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t9) = 1;

LAB24:    t23 = (t9 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t9);
    t27 = (t26 & t25);
    t28 = (t27 != 0);
    if (t28 > 0)
        goto LAB25;

LAB26:    xsi_set_current_line(235, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t3, 32, t2, 32);
    t4 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t4, t9, 0, 0, 32, 0LL);

LAB27:    goto LAB19;

LAB11:    xsi_set_current_line(237, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1048U);
    t7 = *((char **)t4);
    memset(t31, 0, 8);
    t4 = (t31 + 4);
    t8 = (t7 + 4);
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t31) = t11;
    t12 = *((unsigned int *)t8);
    t13 = (t12 >> 0);
    *((unsigned int *)t4) = t13;
    t14 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t14 & 67108863U);
    t15 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t15 & 67108863U);
    t22 = (t0 + 1048U);
    t23 = *((char **)t22);
    memset(t32, 0, 8);
    t22 = (t32 + 4);
    t29 = (t23 + 4);
    t16 = *((unsigned int *)t23);
    t17 = (t16 >> 28);
    *((unsigned int *)t32) = t17;
    t18 = *((unsigned int *)t29);
    t19 = (t18 >> 28);
    *((unsigned int *)t22) = t19;
    t20 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t20 & 15U);
    t21 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t21 & 15U);
    xsi_vlogtype_concat(t9, 32, 32, 3U, t32, 4, t31, 26, t3, 2);
    t30 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t30, t9, 0, 0, 32, 0LL);
    goto LAB19;

LAB13:    xsi_set_current_line(238, ng0);
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    t3 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 32, 0LL);
    goto LAB19;

LAB15:    xsi_set_current_line(239, ng0);

LAB28:    xsi_set_current_line(240, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng3)));
    memset(t31, 0, 8);
    xsi_vlog_signed_greatereq(t31, 32, t4, 32, t3, 32);
    t7 = (t31 + 4);
    t10 = *((unsigned int *)t7);
    t11 = (~(t10));
    t12 = *((unsigned int *)t31);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB29;

LAB30:    xsi_set_current_line(241, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t3, 32, t2, 32);
    t4 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t4, t9, 0, 0, 32, 0LL);

LAB31:    goto LAB19;

LAB17:    xsi_set_current_line(243, ng0);

LAB32:    xsi_set_current_line(244, ng0);
    t3 = (t0 + 1368U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng3)));
    memset(t31, 0, 8);
    xsi_vlog_signed_greatereq(t31, 32, t4, 32, t3, 32);
    t7 = (t31 + 4);
    t10 = *((unsigned int *)t7);
    t11 = (~(t10));
    t12 = *((unsigned int *)t31);
    t13 = (t12 & t11);
    t14 = (t13 != 0);
    if (t14 > 0)
        goto LAB33;

LAB34:    xsi_set_current_line(245, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t3, 32, t2, 32);
    t4 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t4, t9, 0, 0, 32, 0LL);

LAB35:    goto LAB19;

LAB23:    t22 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB24;

LAB25:    xsi_set_current_line(234, ng0);
    t29 = (t0 + 1208U);
    t30 = *((char **)t29);
    t29 = ((char*)((ng1)));
    t33 = (t0 + 1048U);
    t34 = *((char **)t33);
    memset(t32, 0, 8);
    t33 = (t32 + 4);
    t35 = (t34 + 4);
    t36 = *((unsigned int *)t34);
    t37 = (t36 >> 0);
    *((unsigned int *)t32) = t37;
    t38 = *((unsigned int *)t35);
    t39 = (t38 >> 0);
    *((unsigned int *)t33) = t39;
    t40 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t40 & 65535U);
    t41 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t41 & 65535U);
    t43 = ((char*)((ng4)));
    t44 = (t0 + 1048U);
    t45 = *((char **)t44);
    memset(t46, 0, 8);
    t44 = (t46 + 4);
    t47 = (t45 + 4);
    t48 = *((unsigned int *)t45);
    t49 = (t48 >> 15);
    t50 = (t49 & 1);
    *((unsigned int *)t46) = t50;
    t51 = *((unsigned int *)t47);
    t52 = (t51 >> 15);
    t53 = (t52 & 1);
    *((unsigned int *)t44) = t53;
    xsi_vlog_mul_concat(t42, 14, 1, t43, 1U, t46, 1);
    xsi_vlogtype_concat(t31, 32, 32, 3U, t42, 14, t32, 16, t29, 2);
    memset(t54, 0, 8);
    xsi_vlog_unsigned_add(t54, 32, t30, 32, t31, 32);
    t55 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t55, t54, 0, 0, 32, 0LL);
    goto LAB27;

LAB29:    xsi_set_current_line(240, ng0);
    t8 = (t0 + 1208U);
    t22 = *((char **)t8);
    t8 = ((char*)((ng1)));
    t23 = (t0 + 1048U);
    t29 = *((char **)t23);
    memset(t42, 0, 8);
    t23 = (t42 + 4);
    t30 = (t29 + 4);
    t15 = *((unsigned int *)t29);
    t16 = (t15 >> 0);
    *((unsigned int *)t42) = t16;
    t17 = *((unsigned int *)t30);
    t18 = (t17 >> 0);
    *((unsigned int *)t23) = t18;
    t19 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t19 & 65535U);
    t20 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t20 & 65535U);
    t33 = ((char*)((ng4)));
    t34 = (t0 + 1048U);
    t35 = *((char **)t34);
    memset(t54, 0, 8);
    t34 = (t54 + 4);
    t43 = (t35 + 4);
    t21 = *((unsigned int *)t35);
    t24 = (t21 >> 15);
    t25 = (t24 & 1);
    *((unsigned int *)t54) = t25;
    t26 = *((unsigned int *)t43);
    t27 = (t26 >> 15);
    t28 = (t27 & 1);
    *((unsigned int *)t34) = t28;
    xsi_vlog_mul_concat(t46, 14, 1, t33, 1U, t54, 1);
    xsi_vlogtype_concat(t32, 32, 32, 3U, t46, 14, t42, 16, t8, 2);
    memset(t56, 0, 8);
    xsi_vlog_unsigned_add(t56, 32, t22, 32, t32, 32);
    t44 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t44, t56, 0, 0, 32, 0LL);
    goto LAB31;

LAB33:    xsi_set_current_line(244, ng0);
    t8 = (t0 + 1688U);
    t22 = *((char **)t8);
    t8 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t8, t22, 0, 0, 32, 0LL);
    goto LAB35;

}


extern void work_m_00000000000820171885_1210087084_init()
{
	static char *pe[] = {(void *)Always_229_0};
	xsi_register_didat("work_m_00000000000820171885_1210087084", "isim/globalTest_isim_beh.exe.sim/work/m_00000000000820171885_1210087084.didat");
	xsi_register_executes(pe);
}
