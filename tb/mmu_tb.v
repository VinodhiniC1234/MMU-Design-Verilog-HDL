`timescale 1ns/1ps


module MMU_tb;


// Inputs
reg clk;
reg reset;
reg enable;
reg [15:0] virtual_addr;
reg read_write;


// Outputs
wire [15:0] physical_addr;
wire page_fault;
wire protection_fault;
wire translation_valid;



// Instantiate MMU

MMU dut (

.clk(clk),
.reset(reset),
.enable(enable),

.virtual_addr(virtual_addr),
.read_write(read_write),

.physical_addr(physical_addr),

.page_fault(page_fault),

.protection_fault(protection_fault),

.translation_valid(translation_valid)

);



// Clock generation

always #5 clk = ~clk;



// Test sequence

initial begin


// Waveform generation

$dumpfile("mmu_waveform.vcd");

$dumpvars(0,MMU_tb);



// Initial values

clk = 0;

reset = 1;

enable = 0;

virtual_addr = 16'h0000;

read_write = 0;



// Reset

#10;

reset = 0;



// -----------------------------
// Test 1
// Valid READ access
// Page 0 -> Frame 5
// VA = 0035
// PA = 0535
// -----------------------------

enable = 1;

read_write = 0;

virtual_addr = 16'h0035;


#20;



// -----------------------------
// Test 2
// WRITE protection failure
// Page 1 valid
// Write permission = 0
// -----------------------------

read_write = 1;

virtual_addr = 16'h0135;


#20;



// -----------------------------
// Test 3
// Invalid page
// Page 2 valid bit = 0
// -----------------------------

read_write = 0;

virtual_addr = 16'h0235;


#20;



// -----------------------------
// Test 4
// Valid WRITE access
// Page 3 -> Frame 20
// -----------------------------

read_write = 1;

virtual_addr = 16'h0335;


#20;



$finish;


end




// Display output

initial begin


$monitor(
"Time=%0t | VA=%h | PA=%h | PageFault=%b | ProtectionFault=%b | TranslationValid=%b",
$time,
virtual_addr,
physical_addr,
page_fault,
protection_fault,
translation_valid
);


end



endmodule