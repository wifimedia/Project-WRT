#
# Copyright (C) 2015-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=npc
PKG_VERSION:=0.23.2
PKG_RELEASE:=1

ifeq ($(ARCH),mipsel)
	NPC_ARCH:=mipsle
endif
ifeq ($(ARCH),mips)
	NPC_ARCH:=mips
endif
ifeq ($(ARCH),i386)
	NPC_ARCH:=386
endif
ifeq ($(ARCH),x86_64)
	NPC_ARCH:=amd64
endif
ifeq ($(ARCH),arm)
	NPC_ARCH:=arm
endif
ifeq ($(ARCH),aarch64)
	NPC_ARCH:=arm64
endif

PKG_LICENSE:=Apache-2.0

PKG_SOURCE_URL:=https://github.com/cnlh/nps/releases/download/v$(PKG_VERSION)
PKG_SOURCE:=linux_$(NPC_ARCH)_client.tar.gz
PKG_BUILD_DIR:=$(BUILD_DIR)/nps
PKG_HASH:=skip

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	TITLE:=NPC Client
	DEPENDS:=
	URL:=https://github.com/cnlh/nps/releases
endef



define Package/$(PKG_NAME)/description
npc is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet
endef

define Build/Prepare
	$(PKG_UNPACK)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/npc $(1)/usr/bin/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
