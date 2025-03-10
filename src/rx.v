module uart_rx (
    input wire clk,
    input wire rx,
    output reg [7:0] data_out,
    output reg data_valid
);
    
    reg [7:0] stock;
    reg [3:0] compt = 0;

    always @(posedge clk) begin 
        if (compt == 0) begin
            data_valid <= 0; // Reset du signal de validité
        end
        
        if (rx == 0 && compt == 0) begin
            compt <= 1; // Début de réception
        end else if (compt > 0 && compt < 9) begin
            stock <= {rx, stock[7:1]};
            compt <= compt + 1;
        end else if (compt == 9) begin
            if (rx == 1) begin // Vérification du bit de stop
                data_out <= stock;
                data_valid <= 1;
            end else begin
                data_valid <= 0; // Erreur de transmission
            end
            compt <= 0;
        end
    end 
endmodule
