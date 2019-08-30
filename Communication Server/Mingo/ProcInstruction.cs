using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mingo
{
    class ProcInstruction
    {
        interfaceEngine list;
        String[] Instructions=new String[30];
        String buffer;
        ProcInstruction(interfaceEngine argu)
        {
            list = argu;
            if (list.PickUpFeasibility()!=null)
            {
                while (true)
                {
                    buffer=list.Dequeue().Substring('|');
                    Console.WriteLine(buffer);
                }
            }
        }


    }
}
