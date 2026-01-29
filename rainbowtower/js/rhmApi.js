// AdSense reklamları devre dışı bırakıldı

window.adsbygoogle = window.adsbygoogle || [];

function InitSDKJs() {
    console.log("SDK Init - Reklamlar devre dışı");
    myGameInstance.SendMessage('RHMAdsManager', 'InitSucceed', 'ca-pub-8349441957149316');
}

function CallInterstitialAdsJs() {
    console.log("Interstitial Ads atlandı");
    // Reklam yok, direkt devam
    resumeGameAfterAds();
}

function LoadRewardedAdsJs() {
    console.log("LoadRewardedAds atlandı");
    // Reklam yüklenmiş gibi davran
    RewardedAdsLoaded();
}

function CallRewardedAdsJs() {
    console.log("Rewarded Ads atlandı - Ödül direkt verildi");
    // Reklam izlenmeden ödül ver
    RewardSuccessful();
}

function RewardedAdsLoaded() {
    console.log("Rewarded Ads Available (simüle)");
    myGameInstance.SendMessage('RHMAdsManager', 'isRewardedAdsLoaded', 'true');
}

function RewardedAdsNotLoaded() {
    console.log("Rewarded Ads Not Available");
    myGameInstance.SendMessage('RHMAdsManager', 'isRewardedAdsLoaded', 'false');
}

function RewardedAdsDismissed() {
    console.log("Reward Dismissed");
    myGameInstance.SendMessage('RHMAdsManager', 'RewardedAdsFailed');
}

function RewardSuccessful() {
    console.log("gainReward");
    myGameInstance.SendMessage('RHMAdsManager', 'RewardedAdsSuccessfull');
}

function pauseGameBeforeAds() {
    myGameInstance.SendMessage('RHMAdsManager', 'pauseGame');
}

function resumeGameAfterAds() {
    myGameInstance.SendMessage('RHMAdsManager', 'resumeGame');
}