module Comparador #(parameter 
    shortreal TH=2.9,  //Voltaje minimo Encendido
    shortreal HV=4.1   //Voltaje maximo
    )(
    input logic clk,
    input logic arst_n,
    input shortreal VDD, //Voltaje de entrada
    output logic pg   //en el rango de voltaje
    );
    logic set;    //Voltaje seteado
    logic high;   //Mayor al voltaje //
    
    logic low;   //Menor al voltaje
    logic good;
    logic high_r;
    assign low  = VDD < TH;
    assign high = VDD > HV;
    assign good = ~(low | high);
    always_ff@(posedge clk, negedge arst_n)begin
        if(!arst_n)
            high_r <= 0;
        else if(high)
            high_r <= 1;
        else if(low)
            high_r <= 0;
    end
    assign pg = (!high_r) & good; 
    
endmodule
