# CoSteward



[![Open issues](https://img.shields.io/github/issues/rickballard/CoSteward)](../../issues) [![PRs](https://img.shields.io/github/issues-pr/rickballard/CoSteward)](../../pulls) [![License](https://img.shields.io/github/license/rickballard/CoSteward)](./LICENSE)

Human-friendly overview + Megascroll

### Quick start
- **Read**: the Megascroll (single-page canon) if present.
- **Skim**: the Canon Index to jump to what you need.
- **Contribute**: open a Discussion, then a small PR.

## Explore
_(Content map will grow as repo fills out.)_

<details>
<summary><b>For maintainers / ops</b></summary>

- Scripts live under ops/ and .github/.
- Seed-kit: see CoCache → ops/kits/Build-CoSuiteSeedKit.ps1.

</details>

> **Initiatives Dashboard:** CSV (auto-refreshed) → [https://raw.githubusercontent.com/rickballard/CoCache/main/docs/dashboards/initiatives_scan.csv](https://raw.githubusercontent.com/rickballard/CoCache/main/docs/dashboards/initiatives_scan.csv)


[![Initiatives Dashboard](https://img.shields.io/badge/Initiatives-CSV-blue)](https://raw.githubusercontent.com/rickballard/CoCache/main/docs/dashboards/initiatives_scan.csv)

## Status & Dashboards

- **Control Room:** https://github.com/rickballard/CoCache/blob/main/docs/CONSOLE.md  
- **Giant Metrics Index:** https://github.com/rickballard/CoCache/blob/main/docs/METRICS_INDEX.md
<!-- BEGIN: STATUS -->
### Operational Status
CoDrift Index: n/a% (n/a)
<!-- END: STATUS -->


## Live CoSync Feed
<!-- CoSync: Recent Activity (Top 50) -->
<div id="cosync-recent" style="font:14px system-ui; background:#0b1020; color:#e8f2ff; border-radius:12px; padding:12px; max-height:320px; overflow:auto; border:1px solid #1b2a4a;">
  <div style="opacity:.85;margin-bottom:6px;">Recent activity (Top 50)</div>
  <ul id="cosync-list" style="list-style:none;padding-left:0;margin:0;"></ul>
</div>
<script>
(async ()=>{
  try{
    // If CoSteward hosts its own copy, set this to its relative path.
    // Otherwise, point to the raw or Pages URL of CoCache's feed.
    const feed = 'site/cosync_feed/top50.json';
    const res  = await fetch(feed, {cache: 'no-store'});
    const items= await res.json();
    const ul   = document.getElementById('cosync-list');
    items.forEach(i=>{
      const li=document.createElement('li'); li.style.margin='6px 0';
      const dt=new Date(i.when).toLocaleString();
      const text = `${dt} · ${i.repo} · ${i.area}/${i.type} — ${i.summary||''}`;
      li.textContent = text; ul.appendChild(li);
    });
  }catch(e){ console.error('CoSync widget error:', e); }
})();
</script>

