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
static const char *ng0 = "C:/Users/PC/Desktop/Homework 4_2/MicroprocessorComponents/DataMemory.v";
static const char *ng1 = "dMem.txt";



static void Initial_13_0(char *t0)
{
    char *t1;

LAB0:    xsi_set_current_line(13, ng0);
    t1 = (t0 + 2360);
    xsi_vlogfile_readmemb(ng1, 0, t1, 0, 0, 0, 0);

LAB1:    return;
}

static void Always_14_1(char *t0)
{
    char t13[8];
    char t14[8];
    char t33[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    int t24;
    char *t25;
    unsigned int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    int t31;
    int t32;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;

LAB0:    t1 = (t0 + 3528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(14, ng0);
    t2 = (t0 + 4096);
    *((int *)t2) = 1;
    t3 = (t0 + 3560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(14, ng0);

LAB5:    xsi_set_current_line(15, ng0);
    t4 = (t0 + 1480U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 2360);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2360);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t15 = (t0 + 2360);
    t16 = (t15 + 64U);
    t17 = *((char **)t16);
    t18 = (t0 + 1800U);
    t19 = *((char **)t18);
    xsi_vlog_generic_get_array_select_value(t13, 32, t4, t12, t17, 2, 1, t19, 5, 2);
    t18 = (t0 + 2360);
    t20 = (t0 + 2360);
    t21 = (t20 + 72U);
    t22 = *((char **)t21);
    t25 = (t0 + 2360);
    t34 = (t25 + 64U);
    t35 = *((char **)t34);
    t36 = (t0 + 1800U);
    t37 = *((char **)t36);
    xsi_vlog_generic_convert_array_indices(t14, t33, t22, t35, 2, 1, t37, 5, 2);
    t36 = (t14 + 4);
    t6 = *((unsigned int *)t36);
    t24 = (!(t6));
    t38 = (t33 + 4);
    t7 = *((unsigned int *)t38);
    t27 = (!(t7));
    t28 = (t24 && t27);
    if (t28 == 1)
        goto LAB11;

LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(15, ng0);
    t11 = (t0 + 1640U);
    t12 = *((char **)t11);
    t11 = (t0 + 2360);
    t15 = (t0 + 2360);
    t16 = (t15 + 72U);
    t17 = *((char **)t16);
    t18 = (t0 + 2360);
    t19 = (t18 + 64U);
    t20 = *((char **)t19);
    t21 = (t0 + 1800U);
    t22 = *((char **)t21);
    xsi_vlog_generic_convert_array_indices(t13, t14, t17, t20, 2, 1, t22, 5, 2);
    t21 = (t13 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (!(t23));
    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t24 && t27);
    if (t28 == 1)
        goto LAB9;

LAB10:    goto LAB8;

LAB9:    t29 = *((unsigned int *)t13);
    t30 = *((unsigned int *)t14);
    t31 = (t29 - t30);
    t32 = (t31 + 1);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, *((unsigned int *)t14), t32, 0LL);
    goto LAB10;

LAB11:    t8 = *((unsigned int *)t14);
    t9 = *((unsigned int *)t33);
    t31 = (t8 - t9);
    t32 = (t31 + 1);
    xsi_vlogvar_wait_assign_value(t18, t13, 0, *((unsigned int *)t33), t32, 0LL);
    goto LAB12;

}

static void Always_18_2(char *t0)
{
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    t1 = (t0 + 3776U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 4112);
    *((int *)t2) = 1;
    t3 = (t0 + 3808);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(19, ng0);
    t4 = (t0 + 2360);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t0 + 2360);
    t9 = (t8 + 72U);
    t10 = *((char **)t9);
    t11 = (t0 + 2360);
    t12 = (t11 + 64U);
    t13 = *((char **)t12);
    t14 = (t0 + 1800U);
    t15 = *((char **)t14);
    xsi_vlog_generic_get_array_select_value(t7, 32, t6, t10, t13, 2, 1, t15, 5, 2);
    t14 = (t0 + 2200);
    xsi_vlogvar_wait_assign_value(t14, t7, 0, 0, 32, 0LL);
    goto LAB2;

}


extern void work_m_00000000002877157636_0640876095_init()
{
	static char *pe[] = {(void *)Initial_13_0,(void *)Always_14_1,(void *)Always_18_2};
	xsi_register_didat("work_m_00000000002877157636_0640876095", "isim/tb_Pipeline_isim_beh.exe.sim/work/m_00000000002877157636_0640876095.didat");
	xsi_register_executes(pe);
}
