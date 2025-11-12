```bash
npm i -g pm2
pm2 start build/index.js --name my-name --env production
pm2 startup launchd
# it asks for copy/paste:
# sudo env PATH=$PATH:/opt/homebrew/Cellar/node/25.1.0_1/bin /Users/ales/Library/pnpm/global/5/.pnpm/pm2@5.4.3/node_modules/pm2/bin/pm2 startup launchd -u ales --hp /Users/ales
pm2 save
pm2 unstartup launchd
