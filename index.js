const contractAddress = "0x34a72621aF3bc58Ee656Bb9191A6ad90E6b8B37B";

var walletContract;

const connect = async () => {
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  const signer = provider.getSigner();
  walletContract = new ethers.Contract(contractAddress, abi, signer);
  const accounts = await window.ethereum.request({
    method: "eth_requestAccounts",
  });
  const account = accounts[0];

  document.getElementById("wallet-address").textContent =
    account.substring(0, 5) + "..." + account.substring(37, 42);
  document.getElementById("pending-allowance").textContent =
    await walletContract.myAllowance();
  document.getElementById("wallet-balance").textContent =
    await walletContract.getWalletBalance();
};

const renew = async () => {
  const account = document.getElementById("user").value;
  const amount = document.getElementById("allowance").value;
  console.log("Account is: ", account);
  var tx = await walletContract.renewAllowance(account, amount, 86400);
  await tx.wait();
};

const spend = async () => {
  const account = document.getElementById("receiver").value;
  const amount = document.getElementById("amount").value;
  var tx = await walletContract.spendCoins(account, amount);
  await tx.wait();
};
