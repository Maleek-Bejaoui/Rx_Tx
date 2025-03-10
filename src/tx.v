module uart_tx (
    input wire clk,
    input wire send,
    input wire [7:0] data_in,
    output reg tx
);



    reg [9:0] shift_reg = 10'b1111111111; // Start bit (0), data (8 bits), Stop bit (1)
    reg [3:0] bit_count = 10; // Compteur de bits (0 à 10)

    always @(posedge clk) begin
        if (send && bit_count == 10) begin
            // Chargement du nouveau message : Start bit (0), Data (8 bits), Stop bit (1)
            shift_reg <= {1'b1, data_in, 1'b0};
            bit_count <= 0;
        end else if (bit_count < 10) begin
            // Envoi séquentiel des bits
            tx <= shift_reg[0];
            shift_reg <= {1'b1, shift_reg[9:1]}; // Décalage vers la droite
            bit_count <= bit_count + 1;
        end
    end

endmodule
