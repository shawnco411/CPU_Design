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
    work_m_00000000003960861626_1733832700_init();
    work_m_00000000000345888011_0069534409_init();
    work_m_00000000001215942038_0467708899_init();
    work_m_00000000001888480300_3224323566_init();
    work_m_00000000001215043229_2481160641_init();
    work_m_00000000000290555132_2359765006_init();
    work_m_00000000003065592373_2971345626_init();
    work_m_00000000001386841999_4045258060_init();
    work_m_00000000000147564170_0992325708_init();
    work_m_00000000002759777336_3527808377_init();
    work_m_00000000001372615949_2768627095_init();
    work_m_00000000000820171885_1210087084_init();
    work_m_00000000002201520069_1621229167_init();
    work_m_00000000002316764631_0886308060_init();
    work_m_00000000004074286883_0913021432_init();
    work_m_00000000000147564170_1555427044_init();
    work_m_00000000000411975988_2924402094_init();
    work_m_00000000002622926946_3689961810_init();
    work_m_00000000002759777336_4216541002_init();
    work_m_00000000003279470059_2816134107_init();
    work_m_00000000000352731329_3210399350_init();
    work_m_00000000003061837777_2286550455_init();
    work_m_00000000003441262748_3877310806_init();
    work_m_00000000002047498008_1305434678_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002047498008_1305434678");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
