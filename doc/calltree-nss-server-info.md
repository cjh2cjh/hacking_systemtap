# table of content
* [nss_client_query_server_status](#nss_client_query_server_status)
* [nss_client_manage_server_trust](#nss_client_manage_server_trust)


## nss_client_query_server_status
* query_server_status(s, status_string)
  * pmask = server_spec_to_pmask(working_string)
  * get_server_info(s, pmask, raw_servers)
    * note: compiled servers were stored in s->server_cache field, see 'cscache'
    * nss_get_all_server_info(s, servers)
      * nss_get_or_keep_online_server_info(s, all_servers, false)
        * online_servers = s->server_cache->online_servers
        * if online_servers.empty() and s.http_servers.empty()
          * simple_poll = avahi_simple_poll_new()
          * client = avahi_client_new()
          * avahi_service_browser_new()
          * avahi_simple_poll_loop()
          * nss_add_server_info(avahi_servers, online_servers)
        * if s.http_servers not empty
          * nss_get_specified_server_info(s, specified_servers)
            * specified_servers = s->server_cache->specified_servers
            * if s.specified_servers.empty and s.http_servers.empty
              * get_default_server_info(s, specified_servers)
            * otherwise
              * iterate through s.http_servers or s.specified_servers
              * client_backend->fill_in_server_info
          * for each specified server
            * client_backend->fill_in_server_info
      * nss_get_or_keep_trusted_server_info(s, all_servers, false)
        * private_ssl_cert_db_path
        * get_server_info_from_db
        * global_ssl_cert_db_path
        * get_server_info_from_db
      * nss_get_or_keep_signing_server_info(s, all_servers, false)
        * signing_cert_db_path
        * get_server_info_from_db
      * nss_add_server_info(all_servers, servers)
        * nss_add_server_info(info, target)
          * merge_server_info(), merge two 'compile_server_info'
    * nss_get_specified_server_info(s, servers)
    * nss_get_or_keep_online_server_info(s, servers, keep)
    * nss_get_or_keep_trusted_server_info(s, servers, keep)
    * nss_get_or_keep_signing_server_info(s, servers, keep)
    * nss_get_or_keep_compatible_server_info(s, servers, keep)
      * nss_get_or_keep_online_server_info(s, online_servers, false)
      * iterate servers to see which ones are compatible
        * check the target of the server with s.kernel_release, s.architecture
  * nss_get_all_server_info(s, servers), for logging
  * nss_keep_common_server_info(raw_servers, servers), for logging
  * preferred_order(servers), for logging
  * log servers

Note: Afterall, 'query_server_status' try to fill servers in s.server_cache

[back to top](#table-of-content)


## nss_client_manage_server_trust
* s.NSPR_init
  * PR_Init
* nss_get_specified_server_info(s, server_list, true)
* global_ssl_cert_db_path / private_ssl_cert_db_path
* revoke_server_trust
  * s.NSPR_init
  * nssInit
  * CERT_GetDefaultCertDB
  * PORT_NewArena
  * server_cert_nickname
  * PK11_FindCertFromNickname
* add_server_trust

Note: According to the specification with '--trust-servers',
      add or remove servers

[back to top](#table-of-content)

