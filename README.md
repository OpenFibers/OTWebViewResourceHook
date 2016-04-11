#OTWebViewResourceHook

Get all resource request will send callback for a paticular UIWebView.

### What sense dose this lib make?

You may build your own cache or delegate for UIWebView, using NSURLProtocol.  
But how if only some instance of UIWebView need to cache, others not?  
Now you can use this lib, mark requests you want to process a very key. Then process requests that only have the very key setted in NSURLProtocol.

### How does it work?

Hooked private API `webThreadWebView:resource:willSendRequest:redirectResponse:fromDataSource:`, But should be AppStore-safe.

### How to use

Just:  

```
[self.webView setResourceRequestWillSendCallback:^(NSMutableURLRequest *request) {
    //make request with a specific key use kvc
    //then check this key in your custom NSURLProtocol to do additional things
    NSLog(@"%@", request);
}];
```

Then get the result:  

```
2016-04-11 20:02:40.334 OTWebViewResourceHookDemo[78470:3494580] <NSMutableURLRequest: 0x7fb0c874ee00> { URL: https://www.google.com/ }
2016-04-11 20:02:43.233 OTWebViewResourceHookDemo[78470:3494621] <NSMutableURLRequest: 0x7fb0c86293d0> { URL: https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_160x56dp.png }
2016-04-11 20:02:43.239 OTWebViewResourceHookDemo[78470:3494621] <NSMutableURLRequest: 0x7fb0c877d330> { URL: data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABqUlEQVR42r3WzyvDcRzH8Y+vOHDkpBwpB46k3MwOfu0wLvgDyE ... RK5CYII= }
2016-04-11 20:02:43.239 OTWebViewResourceHookDemo[78470:3494621] <NSMutableURLRequest: 0x7fb0c851e1d0> { URL: https://ssl.gstatic.com/gb/images/qi2_00ed8ca1.png }
2016-04-11 20:02:43.240 OTWebViewResourceHookDemo[78470:3494621] <NSMutableURLRequest: 0x7fb0c8478260> { URL: https://www.google.com/images/branding/searchlogo/2x/googlelogo_mobile_tier1_srp_color_75x26dp.png }
2016-04-11 20:02:43.442 OTWebViewResourceHookDemo[78470:3494621] <NSMutableURLRequest: 0x7fb0c860c840> { URL: https://www.gstatic.com/og/_/js/k=og.mob.en_US.0n3dfnEB5Yg.O/rt=j/t=zcms/m=md/exm=mih,mab,meb/d=1/ed=1/rs=AA2YrTsBNPSlWJ2BMbIHBK4eVmq2V20FBg }
2016-04-11 20:02:43.443 OTWebViewResourceHookDemo[78470:3494621] <NSMutableURLRequest: 0x7fb0c8755680> { URL: https://www.gstatic.com/og/_/ss/k=og.mob.-1acef7ct182xu.L.W.O/m=md/excm=mih,mab,meb/d=1/ed=1/rs=AA2YrTvAa_V-QaA-TNJALx99xRBpimKd_g }
2016-04-11 20:02:43.445 OTWebViewResourceHookDemo[78470:3494621] <NSMutableURLRequest: 0x7fb0c846a960> { URL: https://www.google.com/xjs/_/js/k=xjs.qs.en_US.jF0tIJclcmg.O/m=sx,c,sb_mob,bct,cdos,elog,jsa,mbsf,r,hsm,qsm,d,csi/am=ANpSAIIDAFNIlLAfHBAC0gAE/rt=j/d=1/t=zcms/rs=ACT90oHgSe_0bybYBix04dNUhZ2uwKDNZQ }
2016-04-11 20:02:43.514 OTWebViewResourceHookDemo[78470:3494621] <NSMutableURLRequest: 0x7fb0c8544ed0> { URL: https://www.google.com/xjs/_/js/k=xjs.qs.en_US.Dtzwg5zLOaY.O/m=sy2,sy4,em0,sy3,aa,abd,sy38,sy37,sy36,sy40,em8,async,sy230,sy440,dvl,sy352,foot,ipv6,shm,sy122,sy128,sy45,sy79,sy132,sy46,sy112,sy133,sy255,sy256,sy251,sy252,sy143,sy259,sy136,sy253,sy258,sy41,sy43,em7,em13,em10,em14,sy254,sy257,skp/am=ANpSAIIDAFNIlLAfHBAC0gAE/rt=j/d=0/t=zcms/rs=ACT90oFwbNdWtc-Qt_bRuyhw--vFWGptMA }
2016-04-11 20:02:43.537 OTWebViewResourceHookDemo[78470:3494621] <NSMutableURLRequest: 0x7fb0c87779c0> { URL: https://www.google.com/images/nav_logo242.png }
2016-04-11 20:02:43.541 OTWebViewResourceHookDemo[78470:3494621] <NSMutableURLRequest: 0x7fb0c876f1f0> { URL: https://www.google.com/gen_204?v=3&s=mobilewebhp&atyp=csi&ei=YZILV-qAPMSGjwPj_LS4Bg&imc=1&imn=1&imp=0&adh=&xjs=init.28.13.sb_mob.25.mbsf.1.async.1.dvl.1.bbd.0&ima=1&rt=xjsls.206,prt.206,iml.206,dcl.217,xjses.242,xjsee.283,xjs.283,ol.308,aft.206,wsrt.2908,cst.795,dnst.0,rqst.1557,rspt.250,sslt.794,rqstt.1557,unt.1,cstt.761,dit.3126 }
```

### LISENCE
MIT.