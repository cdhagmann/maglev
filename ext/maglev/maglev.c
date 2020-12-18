#include "maglev.h"

VALUE rb_mMaglev;

void
Init_maglev(void)
{
  rb_mMaglev = rb_define_module("Maglev");
}
