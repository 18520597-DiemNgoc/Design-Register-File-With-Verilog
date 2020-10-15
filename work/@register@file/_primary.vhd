library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    generic(
        Dwidth          : integer := 32;
        Awidth          : integer := 5
    );
    port(
        Out_A           : out    vl_logic_vector;
        Out_B           : out    vl_logic_vector;
        DataIn          : in     vl_logic_vector;
        WE              : in     vl_logic;
        RE_A            : in     vl_logic;
        RE_B            : in     vl_logic;
        WA              : in     vl_logic_vector;
        RA_A            : in     vl_logic_vector;
        RA_B            : in     vl_logic_vector;
        CLK             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Dwidth : constant is 1;
    attribute mti_svvh_generic_type of Awidth : constant is 1;
end RegisterFile;
