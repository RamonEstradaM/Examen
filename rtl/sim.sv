module sim_comparador();
    bit clk;
    logic arst_n;
    shortreal VDD; //Voltaje de entrada
    logic pg;   //en el rango de voltaje
    
    
    //instanciación
    Comparador Comparador_dut(
        .clk(clk),
        .VDD(VDD),
        .pg(pg),
        .arst_n(arst_n)
    );
    
    always #5ns clk = ~clk;
        //Estimulos
        initial begin
            arst_n = 0;
            VDD=0;
            #20ns;
            arst_n = 1;
            repeat(1)begin
                VDD=3.5;
                repeat(100)@(posedge clk);
                VDD=4.5;
                repeat(100)@(posedge clk);       
                VDD=4.1;
                repeat(100)@(posedge clk);
                VDD=3.8;
                repeat(100)@(posedge clk);
                VDD=2.0;
                repeat(100)@(posedge clk);
                VDD =4.1;
                repeat(100)@(posedge clk);
            end
            
            $finish;            
        end
endmodule
