# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this file,
# You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2014-2019, Lars Asplund lars.anders.asplund@gmail.com

from os.path import join, dirname
from vunit import VUnit

root = dirname(__file__)

ui = VUnit.from_argv()
lib = ui.add_library("lib")
lib.add_source_files(join(root, "*.vhd"))
tb_with_lower_level_control = lib.entity("tb_with_lower_level_control")
tb_with_lower_level_control.scan_tests_from_file(join(root, "test_control.vhd"))
ui.main()
