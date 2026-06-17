`timescale 1ns/1ps

module MMU (

    input clk,
    input reset,

    input enable,

    input [15:0] virtual_addr,

    input read_write,   //0=read 1=write


    output reg [15:0] physical_addr,

    output reg page_fault,

    output reg protection_fault,

    output reg translation_valid

);


// Address division

wire [7:0] page_number;

wire [7:0] offset;


assign page_number = virtual_addr[15:8];

assign offset = virtual_addr[7:0];




// Page table

// frame number
reg [7:0] frame_table [0:255];


// valid bit

reg valid_bit [0:255];


// read permission

reg read_permission [0:255];


// write permission

reg write_permission [0:255];



integer i;



initial begin


    // Default initialization

    for(i=0;i<256;i=i+1)

    begin

        frame_table[i]=0;

        valid_bit[i]=0;

        read_permission[i]=0;

        write_permission[i]=0;

    end



    // Page table entries


    // Page 0 → Frame 5

    frame_table[0]=8'd5;

    valid_bit[0]=1;

    read_permission[0]=1;

    write_permission[0]=1;



    // Page 1 → Frame 10

    frame_table[1]=8'd10;

    valid_bit[1]=1;

    read_permission[1]=1;

    write_permission[1]=0;



    // Page 2 invalid

    valid_bit[2]=0;



    // Page 3 → Frame 20

    frame_table[3]=8'd20;

    valid_bit[3]=1;

    read_permission[3]=1;

    write_permission[3]=1;



end




always @(posedge clk)

begin


if(reset)

begin

physical_addr <=0;

page_fault<=0;

protection_fault<=0;

translation_valid<=0;

end



else if(enable)

begin



// check valid page

if(valid_bit[page_number]==0)

begin


page_fault<=1;

protection_fault<=0;

translation_valid<=0;

physical_addr<=0;


end



// permission check

else if(read_write && 
write_permission[page_number]==0)

begin


page_fault<=0;

protection_fault<=1;

translation_valid<=0;

physical_addr<=0;


end



else if(!read_write &&
read_permission[page_number]==0)

begin


page_fault<=0;

protection_fault<=1;

translation_valid<=0;

physical_addr<=0;


end



// successful translation

else

begin


physical_addr <= {

frame_table[page_number],

offset

};



page_fault<=0;

protection_fault<=0;

translation_valid<=1;


end


end


end


endmodule