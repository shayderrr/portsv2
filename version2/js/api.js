// RHM API - AdSense Removed Version
// Tüm reklam fonksiyonları bypass edildi, oyun donmadan devam eder

var myGameInstance = null;

function InitSDKJs() {
    console.log("InitSDKJs called - Ads disabled, skipping...");
    // Hemen başarılı olarak işaretle
    setTimeout(function() {
        if (myGameInstance) {
            myGameInstance.SendMessage('RHMAdsManager', 'InitSucceed', 'disabled');
        }
    }, 100);
}

function CallInterstitialAdsJs() {
    console.log("CallInterstitialAdsJs called - Ads disabled, skipping...");
    // Reklam yokmuş gibi davran, hemen devam et
    setTimeout(function() {
        resumeGameAfterAds();
    }, 10);
}

function LoadRewardedAdsJs() {
    console.log("LoadRewardedAdsJs called - Ads disabled");
    // Rewarded ads "yüklendi" olarak işaretle (böylece buton aktif kalır istersen)
    // veya "yüklenmedi" olarak işaretle (buton gizlenir)
    setTimeout(function() {
        RewardedAdsNotLoaded();
    }, 10);
}

function CallRewardedAdsJs() {
    console.log("CallRewardedAdsJs called - Ads disabled, skipping...");
    // Reklam izlenmeden ödül ver veya dismiss et
    // Seçenek 1: Ödül ver (test için)
    // setTimeout(function() { RewardSuccessful(); }, 10);
    
    // Seçenek 2: Dismiss et (reklam yok gibi davran)
    setTimeout(function() {
        RewardedAdsDismissed();
    }, 10);
}

function RewardedAdsLoaded() {
    console.log("RewardedAdsLoaded - Ads disabled");
    if (myGameInstance) {
        myGameInstance.SendMessage('RHMAdsManager', 'isRewardedAdsLoaded', 'true');
    }
}

function RewardedAdsNotLoaded() {
    console.log("RewardedAdsNotLoaded - Ads disabled");
    if (myGameInstance) {
        myGameInstance.SendMessage('RHMAdsManager', 'isRewardedAdsLoaded', 'false');
    }
}

function RewardedAdsDismissed() {
    console.log("RewardedAdsDismissed - Ads disabled");
    if (myGameInstance) {
        myGameInstance.SendMessage('RHMAdsManager', 'RewardedAdsFailed');
    }
}

function RewardSuccessful() {
    console.log("RewardSuccessful - Ads disabled");
    if (myGameInstance) {
        myGameInstance.SendMessage('RHMAdsManager', 'RewardedAdsSuccessfull');
    }
}

function pauseGameBeforeAds() {
    console.log("pauseGameBeforeAds - Ads disabled, not pausing");
    // Oyunu durdurmuyoruz çünkü reklam yok
}

function resumeGameAfterAds() {
    console.log("resumeGameAfterAds - Ads disabled");
    if (myGameInstance) {
        myGameInstance.SendMessage('RHMAdsManager', 'resumeGame');
    }
}