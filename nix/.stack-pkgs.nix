{
  overlay = hackage:
    {
      packages = {
        # fixme: no workies
        # "generic-lens" = hackage.generic-lens."1.1.0.0".revisions.default;
      } // {
        cardano-wallet = ./.stack.nix/cardano-wallet.nix;
        acid-state-exts = ./.stack.nix/acid-state-exts.nix;
        cardano-sl-binary = ./.stack.nix/cardano-sl-binary.nix;
        cardano-sl-binary-test = ./.stack.nix/cardano-sl-binary-test.nix;
        cardano-sl-chain = ./.stack.nix/cardano-sl-chain.nix;
        cardano-sl-chain-test = ./.stack.nix/cardano-sl-chain-test.nix;
        cardano-sl-client = ./.stack.nix/cardano-sl-client.nix;
        cardano-sl-cluster = ./.stack.nix/cardano-sl-cluster.nix;
        cardano-sl-core = ./.stack.nix/cardano-sl-core.nix;
        cardano-sl-core-test = ./.stack.nix/cardano-sl-core-test.nix;
        cardano-sl-crypto = ./.stack.nix/cardano-sl-crypto.nix;
        cardano-sl-crypto-test = ./.stack.nix/cardano-sl-crypto-test.nix;
        cardano-sl-db = ./.stack.nix/cardano-sl-db.nix;
        cardano-sl-infra = ./.stack.nix/cardano-sl-infra.nix;
        cardano-sl = ./.stack.nix/cardano-sl.nix;
        cardano-sl-mnemonic = ./.stack.nix/cardano-sl-mnemonic.nix;
        cardano-sl-networking = ./.stack.nix/cardano-sl-networking.nix;
        cardano-sl-node = ./.stack.nix/cardano-sl-node.nix;
        cardano-sl-node-ipc = ./.stack.nix/cardano-sl-node-ipc.nix;
        cardano-sl-util = ./.stack.nix/cardano-sl-util.nix;
        cardano-sl-util-test = ./.stack.nix/cardano-sl-util-test.nix;
        cardano-sl-utxo = ./.stack.nix/cardano-sl-utxo.nix;
        cardano-sl-x509 = ./.stack.nix/cardano-sl-x509.nix;
      };
    };
  resolver = "./cardano-sl.yaml";
}
