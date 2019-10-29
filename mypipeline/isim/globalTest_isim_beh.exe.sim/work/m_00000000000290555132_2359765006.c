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
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {33U, 0U};
static int ng5[] = {1, 0};
static unsigned int ng6[] = {35U, 0U};
static unsigned int ng7[] = {8U, 0U};
static int ng8[] = {3, 0};
static unsigned int ng9[] = {4U, 0U};
static int ng10[] = {4, 0};
static unsigned int ng11[] = {24U, 0U};
static int ng12[] = {5, 0};
static unsigned int ng13[] = {13U, 0U};
static int ng14[] = {2, 0};
static unsigned int ng15[] = {43U, 0U};
static unsigned int ng16[] = {15U, 0U};
static unsigned int ng17[] = {3U, 0U};
static unsigned int ng18[] = {2U, 0U};
static unsigned int ng19[] = {37U, 0U};
static unsigned int ng20[] = {17U, 0U};
static unsigned int ng21[] = {31U, 0U};
static int ng22[] = {6, 0};
static unsigned int ng23[] = {60U, 0U};
static unsigned int ng24[] = {63U, 0U};



static void Always_48_0(char *t0)
{
    char t12[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 4928U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 5248);
    *((int *)t2) = 1;
    t3 = (t0 + 4960);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(48, ng0);

LAB5:    xsi_set_current_line(49, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(53, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);

LAB6:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng16)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng17)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng19)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t6 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t6 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng18)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t6 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng21)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t6 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t6 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng23)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t6 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng24)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 6, t2, 6);
    if (t6 == 1)
        goto LAB33;

LAB34:
LAB35:    goto LAB2;

LAB7:    xsi_set_current_line(59, ng0);

LAB36:    xsi_set_current_line(60, ng0);
    t4 = ((char*)((ng3)));
    t5 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);
    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(62, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1688U);
    t4 = *((char **)t2);

LAB37:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB38;

LAB39:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB40;

LAB41:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB42;

LAB43:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB44;

LAB45:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB46;

LAB47:
LAB48:    goto LAB35;

LAB9:    xsi_set_current_line(83, ng0);

LAB54:    xsi_set_current_line(84, ng0);
    t5 = ((char*)((ng2)));
    t7 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 2, 0LL);
    xsi_set_current_line(85, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(86, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(88, ng0);
    t2 = ((char*)((ng14)));
    t5 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    goto LAB35;

LAB11:    xsi_set_current_line(91, ng0);

LAB55:    xsi_set_current_line(92, ng0);
    t5 = ((char*)((ng2)));
    t7 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 2, 0LL);
    xsi_set_current_line(93, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(96, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(97, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 4, 0LL);
    goto LAB35;

LAB13:    xsi_set_current_line(99, ng0);

LAB56:    xsi_set_current_line(100, ng0);
    t5 = ((char*)((ng5)));
    t7 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 2, 0LL);
    xsi_set_current_line(101, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 4, 0LL);
    goto LAB35;

LAB15:    xsi_set_current_line(104, ng0);

LAB57:    xsi_set_current_line(105, ng0);
    t5 = ((char*)((ng1)));
    t7 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 2, 0LL);
    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 3, 0LL);
    goto LAB35;

LAB17:    xsi_set_current_line(108, ng0);

LAB58:    xsi_set_current_line(109, ng0);
    t5 = ((char*)((ng2)));
    t7 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 2, 0LL);
    xsi_set_current_line(110, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(111, ng0);
    t2 = ((char*)((ng10)));
    t5 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(114, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(115, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    goto LAB35;

LAB19:    xsi_set_current_line(117, ng0);

LAB59:    xsi_set_current_line(118, ng0);
    t5 = ((char*)((ng18)));
    t7 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 2, 0LL);
    xsi_set_current_line(119, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(120, ng0);
    t2 = ((char*)((ng14)));
    t5 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(121, ng0);
    t2 = ((char*)((ng14)));
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 3, 0LL);
    goto LAB35;

LAB21:    xsi_set_current_line(123, ng0);

LAB60:    xsi_set_current_line(124, ng0);
    t5 = ((char*)((ng5)));
    t7 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(125, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(126, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(127, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(128, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    goto LAB35;

LAB23:    xsi_set_current_line(132, ng0);

LAB61:    xsi_set_current_line(133, ng0);
    t5 = (t0 + 1048U);
    t7 = *((char **)t5);

LAB62:    t5 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t7, 5, t5, 5);
    if (t8 == 1)
        goto LAB63;

LAB64:    t2 = ((char*)((ng20)));
    t6 = xsi_vlog_unsigned_case_compare(t7, 5, t2, 5);
    if (t6 == 1)
        goto LAB65;

LAB66:
LAB67:    goto LAB35;

LAB25:    xsi_set_current_line(147, ng0);

LAB73:    xsi_set_current_line(148, ng0);
    t5 = ((char*)((ng14)));
    t9 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t9, t5, 0, 0, 3, 0LL);
    goto LAB35;

LAB27:    xsi_set_current_line(150, ng0);

LAB74:    xsi_set_current_line(151, ng0);
    t5 = ((char*)((ng5)));
    t9 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t9, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(152, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(153, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(154, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(155, ng0);
    t2 = ((char*)((ng22)));
    t5 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 4, 0LL);
    goto LAB35;

LAB29:    xsi_set_current_line(157, ng0);

LAB75:    xsi_set_current_line(158, ng0);
    t5 = ((char*)((ng5)));
    t9 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t9, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(159, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(160, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(161, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(162, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(163, ng0);
    t2 = ((char*)((ng1)));
    t5 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 4, 0LL);
    goto LAB35;

LAB31:    xsi_set_current_line(165, ng0);

LAB76:    xsi_set_current_line(166, ng0);
    t5 = ((char*)((ng5)));
    t9 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t9, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(167, ng0);
    t2 = ((char*)((ng10)));
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(168, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(169, ng0);
    t2 = ((char*)((ng14)));
    t5 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(170, ng0);
    t2 = ((char*)((ng14)));
    t5 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 3, 0LL);
    goto LAB35;

LAB33:    xsi_set_current_line(172, ng0);

LAB77:    xsi_set_current_line(173, ng0);
    t5 = ((char*)((ng5)));
    t9 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t9, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(174, ng0);
    t2 = ((char*)((ng12)));
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(175, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(176, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(177, ng0);
    t2 = ((char*)((ng14)));
    t5 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 3, 0LL);
    goto LAB35;

LAB38:    xsi_set_current_line(64, ng0);

LAB49:    xsi_set_current_line(64, ng0);
    t5 = ((char*)((ng2)));
    t7 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 4, 0LL);
    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    goto LAB48;

LAB40:    xsi_set_current_line(67, ng0);

LAB50:    xsi_set_current_line(67, ng0);
    t5 = ((char*)((ng3)));
    t7 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 4, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    goto LAB48;

LAB42:    xsi_set_current_line(70, ng0);

LAB51:    xsi_set_current_line(71, ng0);
    t5 = ((char*)((ng8)));
    t7 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 3, 0LL);
    goto LAB48;

LAB44:    xsi_set_current_line(73, ng0);

LAB52:    xsi_set_current_line(74, ng0);
    t5 = ((char*)((ng1)));
    t7 = (t0 + 2248);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 2, 0LL);
    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng10)));
    t5 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    goto LAB48;

LAB46:    xsi_set_current_line(78, ng0);

LAB53:    xsi_set_current_line(79, ng0);
    t5 = ((char*)((ng12)));
    t7 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t7, t5, 0, 0, 4, 0LL);
    goto LAB48;

LAB63:    xsi_set_current_line(134, ng0);

LAB68:    xsi_set_current_line(135, ng0);
    t9 = ((char*)((ng10)));
    t10 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t10, t9, 0, 0, 3, 0LL);
    xsi_set_current_line(136, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    goto LAB67;

LAB65:    xsi_set_current_line(138, ng0);

LAB69:    xsi_set_current_line(139, ng0);
    t5 = ((char*)((ng10)));
    t9 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t9, t5, 0, 0, 3, 0LL);
    xsi_set_current_line(140, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(141, ng0);
    t2 = ((char*)((ng14)));
    t5 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(142, ng0);
    t2 = ((char*)((ng14)));
    t5 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(143, ng0);
    t2 = (t0 + 1208U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t12, 0, 8);
    xsi_vlog_signed_greatereq(t12, 32, t5, 32, t2, 32);
    t9 = (t12 + 4);
    t13 = *((unsigned int *)t9);
    t14 = (~(t13));
    t15 = *((unsigned int *)t12);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB70;

LAB71:
LAB72:    goto LAB67;

LAB70:    xsi_set_current_line(143, ng0);
    t10 = ((char*)((ng5)));
    t18 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t18, t10, 0, 0, 1, 0LL);
    goto LAB72;

}


extern void work_m_00000000000290555132_2359765006_init()
{
	static char *pe[] = {(void *)Always_48_0};
	xsi_register_didat("work_m_00000000000290555132_2359765006", "isim/globalTest_isim_beh.exe.sim/work/m_00000000000290555132_2359765006.didat");
	xsi_register_executes(pe);
}
