# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this file,
# You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Copyright (c) 2014-2019, Lars Asplund lars.anders.asplund@gmail.com

from os.path import join, dirname
from vunit import VUnit

ui = VUnit.from_argv()
ui.add_osvvm()
ui.add_verification_components()

src_path = join(dirname(__file__), "src")

axi_dma_lib = ui.add_library("axi_dma_lib")
axi_dma_lib.add_source_files(join(src_path, "*.vhd"))
axi_dma_lib.add_source_files(join(src_path, "test", "*.vhd"))

ui.main()
