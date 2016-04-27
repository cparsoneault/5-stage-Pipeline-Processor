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
static const char *ng0 = "C:/Users/PC/Desktop/Homework 4_2/MicroprocessorComponents/Controller.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {2U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {6U, 0U};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {4U, 0U};
static unsigned int ng7[] = {5U, 0U};
static unsigned int ng8[] = {7U, 0U};
static unsigned int ng9[] = {8U, 0U};
static unsigned int ng10[] = {36U, 0U};
static unsigned int ng11[] = {37U, 0U};
static unsigned int ng12[] = {32U, 0U};
static unsigned int ng13[] = {34U, 0U};
static unsigned int ng14[] = {42U, 0U};
static unsigned int ng15[] = {38U, 0U};
static unsigned int ng16[] = {9U, 0U};
static unsigned int ng17[] = {10U, 0U};
static unsigned int ng18[] = {11U, 0U};
static unsigned int ng19[] = {24U, 0U};
static unsigned int ng20[] = {12U, 0U};
static unsigned int ng21[] = {33U, 0U};



static void Always_336_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;

LAB0:    t1 = (t0 + 7152U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(336, ng0);
    t2 = (t0 + 7472);
    *((int *)t2) = 1;
    t3 = (t0 + 7184);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(336, ng0);

LAB5:    xsi_set_current_line(337, ng0);
    t4 = (t0 + 5672U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t4, 4);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 4);
    if (t6 == 1)
        goto LAB19;

LAB20:
LAB22:
LAB21:    xsi_set_current_line(360, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB23:    goto LAB2;

LAB7:    xsi_set_current_line(338, ng0);
    t7 = ((char*)((ng2)));
    t8 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 4, 0LL);
    goto LAB23;

LAB9:    xsi_set_current_line(339, ng0);
    t3 = ((char*)((ng4)));
    t4 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 4, 0LL);
    goto LAB23;

LAB11:    xsi_set_current_line(340, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 4, 0LL);
    goto LAB23;

LAB13:    xsi_set_current_line(341, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 4, 0LL);
    goto LAB23;

LAB15:    xsi_set_current_line(342, ng0);
    t3 = ((char*)((ng8)));
    t4 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 4, 0LL);
    goto LAB23;

LAB17:    xsi_set_current_line(343, ng0);
    t3 = ((char*)((ng9)));
    t4 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 4, 0LL);
    goto LAB23;

LAB19:    xsi_set_current_line(344, ng0);
    t3 = (t0 + 5832U);
    t4 = *((char **)t3);

LAB24:    t3 = ((char*)((ng10)));
    t9 = xsi_vlog_unsigned_case_compare(t4, 6, t3, 6);
    if (t9 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB35;

LAB36:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB37;

LAB38:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB39;

LAB40:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB41;

LAB42:    t2 = ((char*)((ng19)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB43;

LAB44:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB45;

LAB46:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB47;

LAB48:    t2 = ((char*)((ng21)));
    t6 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB49;

LAB50:
LAB52:
LAB51:    xsi_set_current_line(358, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB53:    goto LAB23;

LAB25:    xsi_set_current_line(345, ng0);
    t7 = ((char*)((ng1)));
    t8 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 4, 0LL);
    goto LAB53;

LAB27:    xsi_set_current_line(346, ng0);
    t3 = ((char*)((ng3)));
    t7 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB53;

LAB29:    xsi_set_current_line(347, ng0);
    t3 = ((char*)((ng2)));
    t7 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB53;

LAB31:    xsi_set_current_line(348, ng0);
    t3 = ((char*)((ng4)));
    t7 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB53;

LAB33:    xsi_set_current_line(349, ng0);
    t3 = ((char*)((ng8)));
    t7 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB53;

LAB35:    xsi_set_current_line(350, ng0);
    t3 = ((char*)((ng9)));
    t7 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB53;

LAB37:    xsi_set_current_line(351, ng0);
    t3 = ((char*)((ng16)));
    t7 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB53;

LAB39:    xsi_set_current_line(352, ng0);
    t3 = ((char*)((ng17)));
    t7 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB53;

LAB41:    xsi_set_current_line(353, ng0);
    t3 = ((char*)((ng18)));
    t7 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB53;

LAB43:    xsi_set_current_line(354, ng0);
    t3 = ((char*)((ng20)));
    t7 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB53;

LAB45:    xsi_set_current_line(355, ng0);
    t3 = ((char*)((ng16)));
    t7 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB53;

LAB47:    xsi_set_current_line(356, ng0);
    t3 = ((char*)((ng17)));
    t7 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB53;

LAB49:    xsi_set_current_line(357, ng0);
    t3 = ((char*)((ng18)));
    t7 = (t0 + 6232);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB53;

}


extern void work_m_00000000001498317385_2115691294_init()
{
	static char *pe[] = {(void *)Always_336_0};
	xsi_register_didat("work_m_00000000001498317385_2115691294", "isim/tb_Pipeline_isim_beh.exe.sim/work/m_00000000001498317385_2115691294.didat");
	xsi_register_executes(pe);
}
