
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Mingo
{
    class interfaceEngine
    {
        String[] Msg = null;
        int Head;
        int First;
        int Size;
        long counter = 0;
        bool init = false;
        bool reverse=false;

        public interfaceEngine(int size)
        {
            Msg = new String[size];
            for(int i=0; i<size; i++)
            {
                Msg[i] = null;
            }
            Head = 0;
            First = 0;
            Size = size;
        }

        public void Enqueue(String tmp)
        {
            if (Feasible())
            {
                Msg[Head] = tmp;
                Head++;
                counter++;
                repair();
                if (init == false)
                    init = true;
            }
        }

        public String PickUpFeasibility()
        {
            return Msg[First];
        }

        public String Dequeue()
        {
            if (Head == First && reverse != true && counter < Size)
                return null;
            if (Feasible())
            {
                String tmp = Msg[First];
                Msg[First] = null;
                First++;
                counter--;
                repair();
                return tmp;
            }

            return null;
        }

        private bool Feasible()
        {
            if (Head <= Size && Head >= First && reverse == false)
                return true;
            else if (First <= Size && Head <= First && reverse == true)
                return true;
            return false;
        }

        private void repair()
        {
            if (Head == Size)
            {
                Head = 0;
                reverse = true;
            }else if(First == Size)
            {
                First = 0;
                reverse = false;
            }
        }
    }
}
