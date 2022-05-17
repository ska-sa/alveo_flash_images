`timescale 1 ps / 1 ps

module au50_bd_wrapper
   (cmc_clk_clk_n,
    cmc_clk_clk_p,
    hbm_cattrip_tri_o,
    pci_express_x1_rxn,
    pci_express_x1_rxp,
    pci_express_x1_txn,
    pci_express_x1_txp,
    pcie_perstn,
    pcie_refclk_clk_n,
    pcie_refclk_clk_p,
    satellite_gpio_0,
    satellite_uart_0_rxd,
    satellite_uart_0_txd);

  input cmc_clk_clk_n;
  input cmc_clk_clk_p;
  output [0:0]hbm_cattrip_tri_o;
  input pci_express_x1_rxn;
  input pci_express_x1_rxp;
  output pci_express_x1_txn;
  output pci_express_x1_txp;
  input pcie_perstn;
  input pcie_refclk_clk_n;
  input pcie_refclk_clk_p;
  input [1:0]satellite_gpio_0;
  input satellite_uart_0_rxd;
  output satellite_uart_0_txd;

  wire cmc_clk_clk_n;
  wire cmc_clk_clk_p;
  wire [0:0]hbm_cattrip_tri_o;
  wire pci_express_x1_rxn;
  wire pci_express_x1_rxp;
  wire pci_express_x1_txn;
  wire pci_express_x1_txp;
  wire pcie_perstn;
  wire pcie_refclk_clk_n;
  wire pcie_refclk_clk_p;
  wire [1:0]satellite_gpio_0;
  wire satellite_uart_0_rxd;
  wire satellite_uart_0_txd;

  au50_bd au50_bd_i
       (.cmc_clk_clk_n(cmc_clk_clk_n),
        .cmc_clk_clk_p(cmc_clk_clk_p),
        .hbm_cattrip_tri_o(hbm_cattrip_tri_o),
        .pci_express_x1_rxn(pci_express_x1_rxn),
        .pci_express_x1_rxp(pci_express_x1_rxp),
        .pci_express_x1_txn(pci_express_x1_txn),
        .pci_express_x1_txp(pci_express_x1_txp),
        .pcie_perstn(pcie_perstn),
        .pcie_refclk_clk_n(pcie_refclk_clk_n),
        .pcie_refclk_clk_p(pcie_refclk_clk_p),
        .s_axi_aclk(s_axi_aclk),
        .satellite_gpio_0(satellite_gpio_0),
        .satellite_uart_0_rxd(satellite_uart_0_rxd),
        .satellite_uart_0_txd(satellite_uart_0_txd));
endmodule

