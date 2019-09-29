BIN_DIR = $(HOME)/bin
BIN = $(BIN_DIR)/dropbox
DROPBOX_DIST = $(HOME)/.dropbox-dist
DAEMON_BIN = $(DROPBOX_DIST)/dropboxd

.PHONY: install uninstall .cron_job

install: $(BIN) .cron_job
	@echo "\e[96mRun '$(BIN) start' manually to associate your account and start Dropbox"
	@echo "cron will start it after reboot (crontab -e for details)\e[0m"

uninstall:
	rm -rf "$(DROPBOX_DIST)" "$(BIN)"
	crontab -l | grep dropboxd && (crontab -l | sed '/dropboxd/d') | crontab -

.cron_job: $(DAEMON_BIN)
	crontab -l | grep dropboxd || (crontab -l; echo "@reboot $(DAEMON_BIN)") | crontab -

$(BIN): | $(BIN_DIR)
	wget -O $(BIN) 'https://www.dropbox.com/download?dl=packages/dropbox.py'
	chmod +x $(BIN)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(DAEMON_BIN):
	cd $(HOME) && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xz
