set wallet_1_name user_1
set wallet_2_name user_2
set miner_wallet_name miner

set wallets_names $wallet_1_name $wallet_2_name $miner_wallet_name

alias bc "bitcoin-cli -regtest -rpcuser=leo -rpcpassword=leo"

function start_bitcoind -a use_new_regtest
    if test -z "$argv[1]"; or test "$argv[1]" != "true" -a "$argv[1]" != "false"
        echo "Usage: start_bitcoind receives a second argument {true,false} to indicate whether it should use a new regtest or the current one if it exists"
        return 1
    end

    if test "$argv[1]" = "true"
        rm -r -f (pwd)/datadir
    end

    mkdir -p (pwd)/datadir

    bitcoind \
        -regtest \
        -datadir=(pwd)/datadir \
        -fallbackfee=0.00001 \
        -addresstype=bech32m \
        -txindex=1 \
        -coinstatsindex \
        -rest \
        -server \
        -rpcport=18443 \
        -rpcuser=leo \
        -rpcpassword=leo
end

function create_wallet -a wallet_name
    bc createwallet $wallet_name
end

function create_wallets
    create_wallet $wallet_1_name
    create_wallet $wallet_2_name
    create_wallet $miner_wallet_name

    bc listwallets
end

function load_all
    bc loadwallet $wallet_1_name
    bc loadwallet $wallet_2_name
    bc loadwallet $miner_wallet_name
end

function bcli
    if contains $argv[-1] $wallets_names
        set -l wallet_name $argv[-1]
        bc -rpcwallet=$wallet_name $argv[1..-2]
    else
        bc $argv
    end
end

# # mine_blocks [wallet_name] [amount_of_blocks]
function mine_blocks
    set -l amount_of_blocks 1
    set -l wallet_name $miner_wallet_name

    if test (count $argv) -ge 1
        set wallet_name $argv[1]
    end

    if test (count $argv) -ge 2
        set amount_of_blocks $argv[2]
    end

    set wallet_address (bcli getnewaddress $wallet_name)
    bc generatetoaddress $amount_of_blocks $wallet_address
end

# electrum
# only one server for simplicity
# use docker for server

function btc-utils
    if test -z "$argv"
        echo "Usage: no arguments passed"
        return 1
    end

    switch $argv[1]
    case "start_bitcoind"
        start_bitcoind $argv[2]
    case "create_wallets"
        create_wallets
    case "load_all"
        load_all
    case "bcli"
        bcli $argv[2..]
    case "mine_blocks"
        mine_blocks $argv[2..]

    case "*"
        echo "Usage: invalid command"
        return 1
    end
end
