library verilog;
use verilog.vl_types.all;
entity TestBench is
    generic(
        Dwidth          : integer := 32;
        Awidth          : integer := 5;
        t               : integer := 20
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Dwidth : constant is 1;
    attribute mti_svvh_generic_type of Awidth : constant is 1;
    attribute mti_svvh_generic_type of t : constant is 1;
end TestBench;
