
[CCode (cheader_filename="shout/shout.h")]
namespace Shout {

	[CCode (cname="int", cprefix="SHOUTERR_", has_type_id=false)]
	public enum Error {
		SUCCESS,
		INSANE,
		NOCONNECT,
		NOLOGIN,
		SOCKET,
		MALLOC,
		METADATA,
		CONNECTED,
		UNCONNECTED,
		UNSUPPORTED,
		BUSY
	}

	[CCode (cname="int", cprefix="SHOUT_FORMAT_", has_type_id=false)]
	public enum Format {
		OGG, MP3, WEBM, VORBIS
	}

	[CCode (cname="int", cprefix="SHOUT_PROTOCOL_", has_type_id=false)]
	public enum Protocol {
		HTTP, XAUDIOCAST, ICY
	}

	[CCode (cname="shout_init")]
	public void init();

	[CCode (cname="shout_shutdown")]
	public void shutdown();

	[CCode (cname="shout_version")]
	public string get_version(out int? major, out int? minor, out int? patch);

	[Compact]
	[CCode (cname="shout_metadata_t", free_function="shout_metadata_free")]
	public class Metadata {
		[CCode (cname="shout_metadata_new")]
		public Metadata ();

		[CCode (cname="shout_metadata_add")]
		public Error add(string name, string value);
	}

	[Compact]
	[CCode (cname="shout_t", free_function="shout_free")]
	public class Server {
		public string host {
			[CCode (cname="shout_set_host")] set;
			[CCode (cname="shout_get_host")] get;
		}
		public ushort port {
			[CCode (cname="shout_set_port")] set;
			[CCode (cname="shout_get_port")] get;
		}
		public string password {
			[CCode (cname="shout_set_password")] set;
			[CCode (cname="shout_get_password")] get;
		}
		public string mount {
			[CCode (cname="shout_set_mount")] set;
			[CCode (cname="shout_get_mount")] get;
		}
		public string name {
			[CCode (cname="shout_set_name")] set;
			[CCode (cname="shout_get_name")] get;
		}
		public string url {
			[CCode (cname="shout_set_url")] set;
			[CCode (cname="shout_get_url")] get;
		}
		public string genre {
			[CCode (cname="shout_set_genre")] set;
			[CCode (cname="shout_get_genre")] get;
		}
		public string user {
			[CCode (cname="shout_set_user")] set;
			[CCode (cname="shout_get_user")] get;
		}
		public string agent {
			[CCode (cname="shout_set_agent")] set;
			[CCode (cname="shout_get_agent")] get;
		}
		public string description {
			[CCode (cname="shout_set_description")] set;
			[CCode (cname="shout_get_description")] get;
		}
		public Format format {
			[CCode (cname="shout_set_format")] set;
			[CCode (cname="shout_get_format")] get;
		}
		public Protocol protocol {
			[CCode (cname="shout_set_protocol")] set;
			[CCode (cname="shout_get_protocol")] get;
		}
		public bool @public {
			[CCode (cname="shout_set_public")] set;
			[CCode (cname="shout_get_public")] get;
		}
		public bool nonblocking {
			[CCode (cname="shout_set_nonblocking")] set;
			[CCode (cname="shout_get_nonblocking")] get;
		}

		[CCode (cname="shout_new")]
		public Server ();

		[CCode (cname="shout_get_error")]
		public unowned string get_error_string();
		
		[CCode (cname="shout_get_errno")]
		public Error get_error();
		
		[CCode (cname="shout_get_connected")]
		private Error get_connected();
		// helper function
		public bool is_connected() {
			return this.get_connected() == Error.CONNECTED;
		}

		[CCode (cname="shout_open")]
		public Error open();

		[CCode (cname="shout_close")]
		public Error close();

		[CCode (cname="shout_sync")]
		public Error sync();

		[CCode (cname="shout_send")]
		public Error send(uint8[] data);

		[CCode (cname="shout_set_metadata")]
		public Error set_metadata(Metadata meta);
	}
}

