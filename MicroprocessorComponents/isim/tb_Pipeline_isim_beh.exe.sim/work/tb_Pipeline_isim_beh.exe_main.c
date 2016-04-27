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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000012604899_2412719700_init();
    work_m_00000000002855451166_1615217148_init();
    work_m_00000000001117723013_4064882979_init();
    work_m_00000000000005259231_3540391442_init();
    work_m_00000000000012604899_2303085812_init();
    work_m_00000000002855451166_0819405969_init();
    work_m_00000000003843058328_1254784232_init();
    work_m_00000000001498317385_2115691294_init();
    work_m_00000000004053302773_4144471541_init();
    work_m_00000000002814169976_0135496986_init();
    work_m_00000000001056516240_2156499935_init();
    work_m_00000000002084989904_1250183139_init();
    work_m_00000000000010020934_0679733227_init();
    work_m_00000000002855451166_0230290649_init();
    work_m_00000000002694495163_1735853705_init();
    work_m_00000000004011510906_3523041770_init();
    work_m_00000000000012604899_3978988016_init();
    work_m_00000000000654735006_3767129342_init();
    work_m_00000000002877157636_0640876095_init();
    work_m_00000000001127276592_2585441800_init();
    work_m_00000000000654735006_2650677435_init();
    work_m_00000000000322518098_2073536934_init();
    work_m_00000000001757750106_1561697608_init();
    work_m_00000000002994561076_4102789177_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002994561076_4102789177");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
