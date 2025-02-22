-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this file,
-- You can obtain one at http://mozilla.org/MPL/2.0/.
--
-- Copyright (c) 2014-2019, Lars Asplund lars.anders.asplund@gmail.com

--
-- The purpose of this package is to provide an integer vector access type (pointer)
-- that can itself be used in arrays and returned from functions unlike a
-- real access type. This is achieved by letting the actual value be a handle
-- into a singleton datastructure of integer vector access types.
--

use work.integer_vector_pkg.all;

use work.codec_pkg.all;
use work.codec_builder_pkg.all;

package integer_vector_ptr_pkg is
  subtype index_t is integer range -1 to integer'high;
  type integer_vector_ptr_t is record
    ref : index_t;
  end record;
  constant null_ptr : integer_vector_ptr_t := (ref => -1);

  alias  ptr_t  is integer_vector_ptr_t;
  alias  val_t  is integer;
  alias  vec_t  is integer_vector_t;
  alias  vav_t  is integer_vector_access_vector_t;
  alias  vava_t is integer_vector_access_vector_access_t;

  function to_integer (
    value : ptr_t
  ) return integer;

  impure function to_integer_vector_ptr (
    value : val_t
  ) return ptr_t;

  impure function new_integer_vector_ptr (
    len   : natural := 0;
    value : val_t := 0
  ) return ptr_t;

  procedure deallocate (
    ptr : ptr_t
  );

  impure function length (
    ptr : ptr_t
  ) return integer;

  procedure set (
    ptr   : ptr_t;
    index : natural;
    value : val_t
  );

  impure function get (
    ptr   : ptr_t;
    index : natural
  ) return val_t;

  procedure reallocate (
    ptr   : ptr_t;
    len   : natural;
    value : val_t := 0
  );

  procedure resize (
    ptr   : ptr_t;
    len   : natural;
    drop  : natural := 0;
    value : val_t := 0
  );

  function encode (
    data : ptr_t
  ) return string;

  function decode (
    code : string
  ) return ptr_t;

  procedure decode (
    constant code   : string;
    variable index  : inout positive;
    variable result : out ptr_t
  );

  alias encode_integer_vector_ptr_t is encode[ptr_t return string];
  alias decode_integer_vector_ptr_t is decode[string return ptr_t];

  constant integer_vector_ptr_t_code_length : positive := integer_code_length;

end package;
