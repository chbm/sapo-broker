#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif
#ifdef do_open
#undef do_open
#endif
#ifdef do_close
#undef do_close
#endif
#ifdef New
#undef New
#endif
#include <stdint.h>
#include <sstream>
#include <google/protobuf/stubs/common.h>
#include <google/protobuf/io/zero_copy_stream.h>
#include "broker.pb.h"

using namespace std;

class broker_OutputStream :
  public google::protobuf::io::ZeroCopyOutputStream {
public:
  explicit broker_OutputStream(SV * sv) :
  sv_(sv), len_(0) {}
  ~broker_OutputStream() {}

  bool Next(void** data, int* size)
  {
    STRLEN nlen = len_ << 1;

    if ( nlen < 16 ) nlen = 16;
    SvGROW(sv_, nlen);
    *data = SvEND(sv_) + len_;
    *size = SvLEN(sv_) - len_;
    len_ = nlen;

    return true;
  }

  void BackUp(int count)
  {
    SvCUR_set(sv_, SvLEN(sv_) - count);
  }

  void Sync() {
    if ( SvCUR(sv_) == 0 ) {
      SvCUR_set(sv_, len_);
    }
  }

  int64_t ByteCount() const
  {
    return (int64_t)SvCUR(sv_);
  }

private:
  SV * sv_;
  STRLEN len_;

  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(broker_OutputStream);
};


typedef ::sapo_broker::Atom_Parameter __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter;
typedef ::sapo_broker::Atom_Header __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header;
typedef ::sapo_broker::Atom_BrokerMessage __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage;
typedef ::sapo_broker::Atom_Publish __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish;
typedef ::sapo_broker::Atom_Poll __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll;
typedef ::sapo_broker::Atom_Accepted __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted;
typedef ::sapo_broker::Atom_AcknowledgeMessage __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage;
typedef ::sapo_broker::Atom_Subscribe __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe;
typedef ::sapo_broker::Atom_Unsubscribe __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe;
typedef ::sapo_broker::Atom_Notification __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification;
typedef ::sapo_broker::Atom_Fault __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault;
typedef ::sapo_broker::Atom_Ping __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping;
typedef ::sapo_broker::Atom_Pong __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong;
typedef ::sapo_broker::Atom_Authentication __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication;
typedef ::sapo_broker::Atom_Action __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action;
typedef ::sapo_broker::Atom __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom;


static ::sapo_broker::Atom_Parameter *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_Parameter * msg0 = new ::sapo_broker::Atom_Parameter;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "name", sizeof("name") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_name(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "value", sizeof("value") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_value(sval);
    }
  }

  return msg0;
}

static ::sapo_broker::Atom_Header *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_Header * msg0 = new ::sapo_broker::Atom_Header;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "parameter", sizeof("parameter") - 1, 0)) != NULL ) {
      if ( SvROK(*sv1) && SvTYPE(SvRV(*sv1)) == SVt_PVAV ) {
        AV * av1 = (AV *)SvRV(*sv1);
        
        for ( int i1 = 0; i1 <= av_len(av1); i1++ ) {
          ::sapo_broker::Atom_Parameter * msg2 = msg0->add_parameter();
          SV ** sv1;
          SV *  sv2;
          
          if ( (sv1 = av_fetch(av1, i1, 0)) != NULL ) {
            sv2 = *sv1;
            if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
              HV *  hv2 = (HV *)SvRV(sv2);
              SV ** sv3;
              
              if ( (sv3 = hv_fetch(hv2, "name", sizeof("name") - 1, 0)) != NULL ) {
                STRLEN len;
                char * str;
                string sval;
                
                str = SvPV(*sv3, len);
                sval.assign(str, len);
                msg2->set_name(sval);
              }
              if ( (sv3 = hv_fetch(hv2, "value", sizeof("value") - 1, 0)) != NULL ) {
                STRLEN len;
                char * str;
                string sval;
                
                str = SvPV(*sv3, len);
                sval.assign(str, len);
                msg2->set_value(sval);
              }
            }
          }
        }
      }
    }
  }

  return msg0;
}

static ::sapo_broker::Atom_BrokerMessage *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_BrokerMessage * msg0 = new ::sapo_broker::Atom_BrokerMessage;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "message_id", sizeof("message_id") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_message_id(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "payload", sizeof("payload") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      
      str = SvPV(*sv1, len);
      msg0->set_payload(str, len);
    }
    if ( (sv1 = hv_fetch(hv0, "expiration", sizeof("expiration") - 1, 0)) != NULL ) {
      int64_t iv0 = strtoll(SvPV_nolen(*sv1), NULL, 0);
      
      msg0->set_expiration(iv0);
    }
    if ( (sv1 = hv_fetch(hv0, "timestamp", sizeof("timestamp") - 1, 0)) != NULL ) {
      int64_t iv0 = strtoll(SvPV_nolen(*sv1), NULL, 0);
      
      msg0->set_timestamp(iv0);
    }
  }

  return msg0;
}

static ::sapo_broker::Atom_Publish *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_Publish * msg0 = new ::sapo_broker::Atom_Publish;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_action_id(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "destination_type", sizeof("destination_type") - 1, 0)) != NULL ) {
      msg0->set_destination_type((::sapo_broker::Atom_DestinationType)SvIV(*sv1));
    }
    if ( (sv1 = hv_fetch(hv0, "destination", sizeof("destination") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_destination(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "message", sizeof("message") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_BrokerMessage * msg2 = msg0->mutable_message();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "message_id", sizeof("message_id") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_message_id(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "payload", sizeof("payload") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          
          str = SvPV(*sv3, len);
          msg2->set_payload(str, len);
        }
        if ( (sv3 = hv_fetch(hv2, "expiration", sizeof("expiration") - 1, 0)) != NULL ) {
          int64_t iv2 = strtoll(SvPV_nolen(*sv3), NULL, 0);
          
          msg2->set_expiration(iv2);
        }
        if ( (sv3 = hv_fetch(hv2, "timestamp", sizeof("timestamp") - 1, 0)) != NULL ) {
          int64_t iv2 = strtoll(SvPV_nolen(*sv3), NULL, 0);
          
          msg2->set_timestamp(iv2);
        }
      }
    }
  }

  return msg0;
}

static ::sapo_broker::Atom_Poll *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_Poll * msg0 = new ::sapo_broker::Atom_Poll;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_action_id(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "destination", sizeof("destination") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_destination(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "timeout", sizeof("timeout") - 1, 0)) != NULL ) {
      int64_t iv0 = strtoll(SvPV_nolen(*sv1), NULL, 0);
      
      msg0->set_timeout(iv0);
    }
  }

  return msg0;
}

static ::sapo_broker::Atom_Accepted *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_Accepted * msg0 = new ::sapo_broker::Atom_Accepted;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_action_id(sval);
    }
  }

  return msg0;
}

static ::sapo_broker::Atom_AcknowledgeMessage *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_AcknowledgeMessage * msg0 = new ::sapo_broker::Atom_AcknowledgeMessage;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_action_id(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "message_id", sizeof("message_id") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_message_id(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "destination", sizeof("destination") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_destination(sval);
    }
  }

  return msg0;
}

static ::sapo_broker::Atom_Subscribe *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_Subscribe * msg0 = new ::sapo_broker::Atom_Subscribe;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_action_id(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "destination", sizeof("destination") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_destination(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "destination_type", sizeof("destination_type") - 1, 0)) != NULL ) {
      msg0->set_destination_type((::sapo_broker::Atom_DestinationType)SvIV(*sv1));
    }
  }

  return msg0;
}

static ::sapo_broker::Atom_Unsubscribe *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_Unsubscribe * msg0 = new ::sapo_broker::Atom_Unsubscribe;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_action_id(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "destination", sizeof("destination") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_destination(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "destination_type", sizeof("destination_type") - 1, 0)) != NULL ) {
      msg0->set_destination_type((::sapo_broker::Atom_DestinationType)SvIV(*sv1));
    }
  }

  return msg0;
}

static ::sapo_broker::Atom_Notification *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_Notification * msg0 = new ::sapo_broker::Atom_Notification;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "destination", sizeof("destination") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_destination(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "subscription", sizeof("subscription") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_subscription(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "destination_type", sizeof("destination_type") - 1, 0)) != NULL ) {
      msg0->set_destination_type((::sapo_broker::Atom_DestinationType)SvIV(*sv1));
    }
    if ( (sv1 = hv_fetch(hv0, "message", sizeof("message") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_BrokerMessage * msg2 = msg0->mutable_message();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "message_id", sizeof("message_id") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_message_id(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "payload", sizeof("payload") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          
          str = SvPV(*sv3, len);
          msg2->set_payload(str, len);
        }
        if ( (sv3 = hv_fetch(hv2, "expiration", sizeof("expiration") - 1, 0)) != NULL ) {
          int64_t iv2 = strtoll(SvPV_nolen(*sv3), NULL, 0);
          
          msg2->set_expiration(iv2);
        }
        if ( (sv3 = hv_fetch(hv2, "timestamp", sizeof("timestamp") - 1, 0)) != NULL ) {
          int64_t iv2 = strtoll(SvPV_nolen(*sv3), NULL, 0);
          
          msg2->set_timestamp(iv2);
        }
      }
    }
  }

  return msg0;
}

static ::sapo_broker::Atom_Fault *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_Fault * msg0 = new ::sapo_broker::Atom_Fault;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_action_id(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "fault_code", sizeof("fault_code") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_fault_code(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "fault_message", sizeof("fault_message") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_fault_message(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "fault_detail", sizeof("fault_detail") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_fault_detail(sval);
    }
  }

  return msg0;
}

static ::sapo_broker::Atom_Ping *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_Ping * msg0 = new ::sapo_broker::Atom_Ping;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_action_id(sval);
    }
  }

  return msg0;
}

static ::sapo_broker::Atom_Pong *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_Pong * msg0 = new ::sapo_broker::Atom_Pong;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_action_id(sval);
    }
  }

  return msg0;
}

static ::sapo_broker::Atom_Authentication *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_Authentication * msg0 = new ::sapo_broker::Atom_Authentication;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_action_id(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "authentication_type", sizeof("authentication_type") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_authentication_type(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "token", sizeof("token") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      
      str = SvPV(*sv1, len);
      msg0->set_token(str, len);
    }
    if ( (sv1 = hv_fetch(hv0, "user_id", sizeof("user_id") - 1, 0)) != NULL ) {
      STRLEN len;
      char * str;
      string sval;
      
      str = SvPV(*sv1, len);
      sval.assign(str, len);
      msg0->set_user_id(sval);
    }
    if ( (sv1 = hv_fetch(hv0, "role", sizeof("role") - 1, 0)) != NULL ) {
      if ( SvROK(*sv1) && SvTYPE(SvRV(*sv1)) == SVt_PVAV ) {
        AV * av1 = (AV *)SvRV(*sv1);
        
        for ( int i1 = 0; i1 <= av_len(av1); i1++ ) {
          SV ** sv1;
          
          if ( (sv1 = av_fetch(av1, i1, 0)) != NULL ) {
            STRLEN len;
            char * str;
            string sval;
            
            str = SvPV(*sv1, len);
            sval.assign(str, len);
            msg0->add_role(sval);
          }
        }
      }
    }
  }

  return msg0;
}

static ::sapo_broker::Atom_Action *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom_Action * msg0 = new ::sapo_broker::Atom_Action;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "publish", sizeof("publish") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_Publish * msg2 = msg0->mutable_publish();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_action_id(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "destination_type", sizeof("destination_type") - 1, 0)) != NULL ) {
          msg2->set_destination_type((::sapo_broker::Atom_DestinationType)SvIV(*sv3));
        }
        if ( (sv3 = hv_fetch(hv2, "destination", sizeof("destination") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_destination(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "message", sizeof("message") - 1, 0)) != NULL ) {
          ::sapo_broker::Atom_BrokerMessage * msg4 = msg2->mutable_message();
          SV * sv4 = *sv3;
          
          if ( SvROK(sv4) && SvTYPE(SvRV(sv4)) == SVt_PVHV ) {
            HV *  hv4 = (HV *)SvRV(sv4);
            SV ** sv5;
            
            if ( (sv5 = hv_fetch(hv4, "message_id", sizeof("message_id") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_message_id(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "payload", sizeof("payload") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              
              str = SvPV(*sv5, len);
              msg4->set_payload(str, len);
            }
            if ( (sv5 = hv_fetch(hv4, "expiration", sizeof("expiration") - 1, 0)) != NULL ) {
              int64_t iv4 = strtoll(SvPV_nolen(*sv5), NULL, 0);
              
              msg4->set_expiration(iv4);
            }
            if ( (sv5 = hv_fetch(hv4, "timestamp", sizeof("timestamp") - 1, 0)) != NULL ) {
              int64_t iv4 = strtoll(SvPV_nolen(*sv5), NULL, 0);
              
              msg4->set_timestamp(iv4);
            }
          }
        }
      }
    }
    if ( (sv1 = hv_fetch(hv0, "poll", sizeof("poll") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_Poll * msg2 = msg0->mutable_poll();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_action_id(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "destination", sizeof("destination") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_destination(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "timeout", sizeof("timeout") - 1, 0)) != NULL ) {
          int64_t iv2 = strtoll(SvPV_nolen(*sv3), NULL, 0);
          
          msg2->set_timeout(iv2);
        }
      }
    }
    if ( (sv1 = hv_fetch(hv0, "accepted", sizeof("accepted") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_Accepted * msg2 = msg0->mutable_accepted();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_action_id(sval);
        }
      }
    }
    if ( (sv1 = hv_fetch(hv0, "ack_message", sizeof("ack_message") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_AcknowledgeMessage * msg2 = msg0->mutable_ack_message();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_action_id(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "message_id", sizeof("message_id") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_message_id(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "destination", sizeof("destination") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_destination(sval);
        }
      }
    }
    if ( (sv1 = hv_fetch(hv0, "subscribe", sizeof("subscribe") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_Subscribe * msg2 = msg0->mutable_subscribe();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_action_id(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "destination", sizeof("destination") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_destination(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "destination_type", sizeof("destination_type") - 1, 0)) != NULL ) {
          msg2->set_destination_type((::sapo_broker::Atom_DestinationType)SvIV(*sv3));
        }
      }
    }
    if ( (sv1 = hv_fetch(hv0, "unsubscribe", sizeof("unsubscribe") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_Unsubscribe * msg2 = msg0->mutable_unsubscribe();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_action_id(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "destination", sizeof("destination") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_destination(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "destination_type", sizeof("destination_type") - 1, 0)) != NULL ) {
          msg2->set_destination_type((::sapo_broker::Atom_DestinationType)SvIV(*sv3));
        }
      }
    }
    if ( (sv1 = hv_fetch(hv0, "notification", sizeof("notification") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_Notification * msg2 = msg0->mutable_notification();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "destination", sizeof("destination") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_destination(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "subscription", sizeof("subscription") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_subscription(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "destination_type", sizeof("destination_type") - 1, 0)) != NULL ) {
          msg2->set_destination_type((::sapo_broker::Atom_DestinationType)SvIV(*sv3));
        }
        if ( (sv3 = hv_fetch(hv2, "message", sizeof("message") - 1, 0)) != NULL ) {
          ::sapo_broker::Atom_BrokerMessage * msg4 = msg2->mutable_message();
          SV * sv4 = *sv3;
          
          if ( SvROK(sv4) && SvTYPE(SvRV(sv4)) == SVt_PVHV ) {
            HV *  hv4 = (HV *)SvRV(sv4);
            SV ** sv5;
            
            if ( (sv5 = hv_fetch(hv4, "message_id", sizeof("message_id") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_message_id(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "payload", sizeof("payload") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              
              str = SvPV(*sv5, len);
              msg4->set_payload(str, len);
            }
            if ( (sv5 = hv_fetch(hv4, "expiration", sizeof("expiration") - 1, 0)) != NULL ) {
              int64_t iv4 = strtoll(SvPV_nolen(*sv5), NULL, 0);
              
              msg4->set_expiration(iv4);
            }
            if ( (sv5 = hv_fetch(hv4, "timestamp", sizeof("timestamp") - 1, 0)) != NULL ) {
              int64_t iv4 = strtoll(SvPV_nolen(*sv5), NULL, 0);
              
              msg4->set_timestamp(iv4);
            }
          }
        }
      }
    }
    if ( (sv1 = hv_fetch(hv0, "fault", sizeof("fault") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_Fault * msg2 = msg0->mutable_fault();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_action_id(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "fault_code", sizeof("fault_code") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_fault_code(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "fault_message", sizeof("fault_message") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_fault_message(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "fault_detail", sizeof("fault_detail") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_fault_detail(sval);
        }
      }
    }
    if ( (sv1 = hv_fetch(hv0, "ping", sizeof("ping") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_Ping * msg2 = msg0->mutable_ping();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_action_id(sval);
        }
      }
    }
    if ( (sv1 = hv_fetch(hv0, "pong", sizeof("pong") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_Pong * msg2 = msg0->mutable_pong();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_action_id(sval);
        }
      }
    }
    if ( (sv1 = hv_fetch(hv0, "auth", sizeof("auth") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_Authentication * msg2 = msg0->mutable_auth();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_action_id(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "authentication_type", sizeof("authentication_type") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_authentication_type(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "token", sizeof("token") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          
          str = SvPV(*sv3, len);
          msg2->set_token(str, len);
        }
        if ( (sv3 = hv_fetch(hv2, "user_id", sizeof("user_id") - 1, 0)) != NULL ) {
          STRLEN len;
          char * str;
          string sval;
          
          str = SvPV(*sv3, len);
          sval.assign(str, len);
          msg2->set_user_id(sval);
        }
        if ( (sv3 = hv_fetch(hv2, "role", sizeof("role") - 1, 0)) != NULL ) {
          if ( SvROK(*sv3) && SvTYPE(SvRV(*sv3)) == SVt_PVAV ) {
            AV * av3 = (AV *)SvRV(*sv3);
            
            for ( int i3 = 0; i3 <= av_len(av3); i3++ ) {
              SV ** sv3;
              
              if ( (sv3 = av_fetch(av3, i3, 0)) != NULL ) {
                STRLEN len;
                char * str;
                string sval;
                
                str = SvPV(*sv3, len);
                sval.assign(str, len);
                msg2->add_role(sval);
              }
            }
          }
        }
      }
    }
    if ( (sv1 = hv_fetch(hv0, "action_type", sizeof("action_type") - 1, 0)) != NULL ) {
      msg0->set_action_type((::sapo_broker::Atom_Action_ActionType)SvIV(*sv1));
    }
  }

  return msg0;
}

static ::sapo_broker::Atom *
__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_from_hashref ( SV * sv0 )
{
  ::sapo_broker::Atom * msg0 = new ::sapo_broker::Atom;

  if ( SvROK(sv0) && SvTYPE(SvRV(sv0)) == SVt_PVHV ) {
    HV *  hv0 = (HV *)SvRV(sv0);
    SV ** sv1;
    
    if ( (sv1 = hv_fetch(hv0, "header", sizeof("header") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_Header * msg2 = msg0->mutable_header();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "parameter", sizeof("parameter") - 1, 0)) != NULL ) {
          if ( SvROK(*sv3) && SvTYPE(SvRV(*sv3)) == SVt_PVAV ) {
            AV * av3 = (AV *)SvRV(*sv3);
            
            for ( int i3 = 0; i3 <= av_len(av3); i3++ ) {
              ::sapo_broker::Atom_Parameter * msg4 = msg2->add_parameter();
              SV ** sv3;
              SV *  sv4;
              
              if ( (sv3 = av_fetch(av3, i3, 0)) != NULL ) {
                sv4 = *sv3;
                if ( SvROK(sv4) && SvTYPE(SvRV(sv4)) == SVt_PVHV ) {
                  HV *  hv4 = (HV *)SvRV(sv4);
                  SV ** sv5;
                  
                  if ( (sv5 = hv_fetch(hv4, "name", sizeof("name") - 1, 0)) != NULL ) {
                    STRLEN len;
                    char * str;
                    string sval;
                    
                    str = SvPV(*sv5, len);
                    sval.assign(str, len);
                    msg4->set_name(sval);
                  }
                  if ( (sv5 = hv_fetch(hv4, "value", sizeof("value") - 1, 0)) != NULL ) {
                    STRLEN len;
                    char * str;
                    string sval;
                    
                    str = SvPV(*sv5, len);
                    sval.assign(str, len);
                    msg4->set_value(sval);
                  }
                }
              }
            }
          }
        }
      }
    }
    if ( (sv1 = hv_fetch(hv0, "action", sizeof("action") - 1, 0)) != NULL ) {
      ::sapo_broker::Atom_Action * msg2 = msg0->mutable_action();
      SV * sv2 = *sv1;
      
      if ( SvROK(sv2) && SvTYPE(SvRV(sv2)) == SVt_PVHV ) {
        HV *  hv2 = (HV *)SvRV(sv2);
        SV ** sv3;
        
        if ( (sv3 = hv_fetch(hv2, "publish", sizeof("publish") - 1, 0)) != NULL ) {
          ::sapo_broker::Atom_Publish * msg4 = msg2->mutable_publish();
          SV * sv4 = *sv3;
          
          if ( SvROK(sv4) && SvTYPE(SvRV(sv4)) == SVt_PVHV ) {
            HV *  hv4 = (HV *)SvRV(sv4);
            SV ** sv5;
            
            if ( (sv5 = hv_fetch(hv4, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_action_id(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "destination_type", sizeof("destination_type") - 1, 0)) != NULL ) {
              msg4->set_destination_type((::sapo_broker::Atom_DestinationType)SvIV(*sv5));
            }
            if ( (sv5 = hv_fetch(hv4, "destination", sizeof("destination") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_destination(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "message", sizeof("message") - 1, 0)) != NULL ) {
              ::sapo_broker::Atom_BrokerMessage * msg6 = msg4->mutable_message();
              SV * sv6 = *sv5;
              
              if ( SvROK(sv6) && SvTYPE(SvRV(sv6)) == SVt_PVHV ) {
                HV *  hv6 = (HV *)SvRV(sv6);
                SV ** sv7;
                
                if ( (sv7 = hv_fetch(hv6, "message_id", sizeof("message_id") - 1, 0)) != NULL ) {
                  STRLEN len;
                  char * str;
                  string sval;
                  
                  str = SvPV(*sv7, len);
                  sval.assign(str, len);
                  msg6->set_message_id(sval);
                }
                if ( (sv7 = hv_fetch(hv6, "payload", sizeof("payload") - 1, 0)) != NULL ) {
                  STRLEN len;
                  char * str;
                  
                  str = SvPV(*sv7, len);
                  msg6->set_payload(str, len);
                }
                if ( (sv7 = hv_fetch(hv6, "expiration", sizeof("expiration") - 1, 0)) != NULL ) {
                  int64_t iv6 = strtoll(SvPV_nolen(*sv7), NULL, 0);
                  
                  msg6->set_expiration(iv6);
                }
                if ( (sv7 = hv_fetch(hv6, "timestamp", sizeof("timestamp") - 1, 0)) != NULL ) {
                  int64_t iv6 = strtoll(SvPV_nolen(*sv7), NULL, 0);
                  
                  msg6->set_timestamp(iv6);
                }
              }
            }
          }
        }
        if ( (sv3 = hv_fetch(hv2, "poll", sizeof("poll") - 1, 0)) != NULL ) {
          ::sapo_broker::Atom_Poll * msg4 = msg2->mutable_poll();
          SV * sv4 = *sv3;
          
          if ( SvROK(sv4) && SvTYPE(SvRV(sv4)) == SVt_PVHV ) {
            HV *  hv4 = (HV *)SvRV(sv4);
            SV ** sv5;
            
            if ( (sv5 = hv_fetch(hv4, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_action_id(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "destination", sizeof("destination") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_destination(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "timeout", sizeof("timeout") - 1, 0)) != NULL ) {
              int64_t iv4 = strtoll(SvPV_nolen(*sv5), NULL, 0);
              
              msg4->set_timeout(iv4);
            }
          }
        }
        if ( (sv3 = hv_fetch(hv2, "accepted", sizeof("accepted") - 1, 0)) != NULL ) {
          ::sapo_broker::Atom_Accepted * msg4 = msg2->mutable_accepted();
          SV * sv4 = *sv3;
          
          if ( SvROK(sv4) && SvTYPE(SvRV(sv4)) == SVt_PVHV ) {
            HV *  hv4 = (HV *)SvRV(sv4);
            SV ** sv5;
            
            if ( (sv5 = hv_fetch(hv4, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_action_id(sval);
            }
          }
        }
        if ( (sv3 = hv_fetch(hv2, "ack_message", sizeof("ack_message") - 1, 0)) != NULL ) {
          ::sapo_broker::Atom_AcknowledgeMessage * msg4 = msg2->mutable_ack_message();
          SV * sv4 = *sv3;
          
          if ( SvROK(sv4) && SvTYPE(SvRV(sv4)) == SVt_PVHV ) {
            HV *  hv4 = (HV *)SvRV(sv4);
            SV ** sv5;
            
            if ( (sv5 = hv_fetch(hv4, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_action_id(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "message_id", sizeof("message_id") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_message_id(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "destination", sizeof("destination") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_destination(sval);
            }
          }
        }
        if ( (sv3 = hv_fetch(hv2, "subscribe", sizeof("subscribe") - 1, 0)) != NULL ) {
          ::sapo_broker::Atom_Subscribe * msg4 = msg2->mutable_subscribe();
          SV * sv4 = *sv3;
          
          if ( SvROK(sv4) && SvTYPE(SvRV(sv4)) == SVt_PVHV ) {
            HV *  hv4 = (HV *)SvRV(sv4);
            SV ** sv5;
            
            if ( (sv5 = hv_fetch(hv4, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_action_id(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "destination", sizeof("destination") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_destination(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "destination_type", sizeof("destination_type") - 1, 0)) != NULL ) {
              msg4->set_destination_type((::sapo_broker::Atom_DestinationType)SvIV(*sv5));
            }
          }
        }
        if ( (sv3 = hv_fetch(hv2, "unsubscribe", sizeof("unsubscribe") - 1, 0)) != NULL ) {
          ::sapo_broker::Atom_Unsubscribe * msg4 = msg2->mutable_unsubscribe();
          SV * sv4 = *sv3;
          
          if ( SvROK(sv4) && SvTYPE(SvRV(sv4)) == SVt_PVHV ) {
            HV *  hv4 = (HV *)SvRV(sv4);
            SV ** sv5;
            
            if ( (sv5 = hv_fetch(hv4, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_action_id(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "destination", sizeof("destination") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_destination(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "destination_type", sizeof("destination_type") - 1, 0)) != NULL ) {
              msg4->set_destination_type((::sapo_broker::Atom_DestinationType)SvIV(*sv5));
            }
          }
        }
        if ( (sv3 = hv_fetch(hv2, "notification", sizeof("notification") - 1, 0)) != NULL ) {
          ::sapo_broker::Atom_Notification * msg4 = msg2->mutable_notification();
          SV * sv4 = *sv3;
          
          if ( SvROK(sv4) && SvTYPE(SvRV(sv4)) == SVt_PVHV ) {
            HV *  hv4 = (HV *)SvRV(sv4);
            SV ** sv5;
            
            if ( (sv5 = hv_fetch(hv4, "destination", sizeof("destination") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_destination(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "subscription", sizeof("subscription") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_subscription(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "destination_type", sizeof("destination_type") - 1, 0)) != NULL ) {
              msg4->set_destination_type((::sapo_broker::Atom_DestinationType)SvIV(*sv5));
            }
            if ( (sv5 = hv_fetch(hv4, "message", sizeof("message") - 1, 0)) != NULL ) {
              ::sapo_broker::Atom_BrokerMessage * msg6 = msg4->mutable_message();
              SV * sv6 = *sv5;
              
              if ( SvROK(sv6) && SvTYPE(SvRV(sv6)) == SVt_PVHV ) {
                HV *  hv6 = (HV *)SvRV(sv6);
                SV ** sv7;
                
                if ( (sv7 = hv_fetch(hv6, "message_id", sizeof("message_id") - 1, 0)) != NULL ) {
                  STRLEN len;
                  char * str;
                  string sval;
                  
                  str = SvPV(*sv7, len);
                  sval.assign(str, len);
                  msg6->set_message_id(sval);
                }
                if ( (sv7 = hv_fetch(hv6, "payload", sizeof("payload") - 1, 0)) != NULL ) {
                  STRLEN len;
                  char * str;
                  
                  str = SvPV(*sv7, len);
                  msg6->set_payload(str, len);
                }
                if ( (sv7 = hv_fetch(hv6, "expiration", sizeof("expiration") - 1, 0)) != NULL ) {
                  int64_t iv6 = strtoll(SvPV_nolen(*sv7), NULL, 0);
                  
                  msg6->set_expiration(iv6);
                }
                if ( (sv7 = hv_fetch(hv6, "timestamp", sizeof("timestamp") - 1, 0)) != NULL ) {
                  int64_t iv6 = strtoll(SvPV_nolen(*sv7), NULL, 0);
                  
                  msg6->set_timestamp(iv6);
                }
              }
            }
          }
        }
        if ( (sv3 = hv_fetch(hv2, "fault", sizeof("fault") - 1, 0)) != NULL ) {
          ::sapo_broker::Atom_Fault * msg4 = msg2->mutable_fault();
          SV * sv4 = *sv3;
          
          if ( SvROK(sv4) && SvTYPE(SvRV(sv4)) == SVt_PVHV ) {
            HV *  hv4 = (HV *)SvRV(sv4);
            SV ** sv5;
            
            if ( (sv5 = hv_fetch(hv4, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_action_id(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "fault_code", sizeof("fault_code") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_fault_code(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "fault_message", sizeof("fault_message") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_fault_message(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "fault_detail", sizeof("fault_detail") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_fault_detail(sval);
            }
          }
        }
        if ( (sv3 = hv_fetch(hv2, "ping", sizeof("ping") - 1, 0)) != NULL ) {
          ::sapo_broker::Atom_Ping * msg4 = msg2->mutable_ping();
          SV * sv4 = *sv3;
          
          if ( SvROK(sv4) && SvTYPE(SvRV(sv4)) == SVt_PVHV ) {
            HV *  hv4 = (HV *)SvRV(sv4);
            SV ** sv5;
            
            if ( (sv5 = hv_fetch(hv4, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_action_id(sval);
            }
          }
        }
        if ( (sv3 = hv_fetch(hv2, "pong", sizeof("pong") - 1, 0)) != NULL ) {
          ::sapo_broker::Atom_Pong * msg4 = msg2->mutable_pong();
          SV * sv4 = *sv3;
          
          if ( SvROK(sv4) && SvTYPE(SvRV(sv4)) == SVt_PVHV ) {
            HV *  hv4 = (HV *)SvRV(sv4);
            SV ** sv5;
            
            if ( (sv5 = hv_fetch(hv4, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_action_id(sval);
            }
          }
        }
        if ( (sv3 = hv_fetch(hv2, "auth", sizeof("auth") - 1, 0)) != NULL ) {
          ::sapo_broker::Atom_Authentication * msg4 = msg2->mutable_auth();
          SV * sv4 = *sv3;
          
          if ( SvROK(sv4) && SvTYPE(SvRV(sv4)) == SVt_PVHV ) {
            HV *  hv4 = (HV *)SvRV(sv4);
            SV ** sv5;
            
            if ( (sv5 = hv_fetch(hv4, "action_id", sizeof("action_id") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_action_id(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "authentication_type", sizeof("authentication_type") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_authentication_type(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "token", sizeof("token") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              
              str = SvPV(*sv5, len);
              msg4->set_token(str, len);
            }
            if ( (sv5 = hv_fetch(hv4, "user_id", sizeof("user_id") - 1, 0)) != NULL ) {
              STRLEN len;
              char * str;
              string sval;
              
              str = SvPV(*sv5, len);
              sval.assign(str, len);
              msg4->set_user_id(sval);
            }
            if ( (sv5 = hv_fetch(hv4, "role", sizeof("role") - 1, 0)) != NULL ) {
              if ( SvROK(*sv5) && SvTYPE(SvRV(*sv5)) == SVt_PVAV ) {
                AV * av5 = (AV *)SvRV(*sv5);
                
                for ( int i5 = 0; i5 <= av_len(av5); i5++ ) {
                  SV ** sv5;
                  
                  if ( (sv5 = av_fetch(av5, i5, 0)) != NULL ) {
                    STRLEN len;
                    char * str;
                    string sval;
                    
                    str = SvPV(*sv5, len);
                    sval.assign(str, len);
                    msg4->add_role(sval);
                  }
                }
              }
            }
          }
        }
        if ( (sv3 = hv_fetch(hv2, "action_type", sizeof("action_type") - 1, 0)) != NULL ) {
          msg2->set_action_type((::sapo_broker::Atom_Action_ActionType)SvIV(*sv3));
        }
      }
    }
  }

  return msg0;
}



MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter
PROTOTYPES: ENABLE


SV *
::sapo_broker::Atom_Parameter::new (...)
  PREINIT:
    ::sapo_broker::Atom_Parameter * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_Parameter;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_Parameter;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Parameter * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Parameter * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Parameter * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Parameter * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 2);
    PUSHs(sv_2mortal(newSVpv("name",0)));
    PUSHs(sv_2mortal(newSVpv("value",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_Parameter * msg0 = THIS;

      if ( msg0->has_name() ) {
        SV * sv0 = newSVpv(msg0->name().c_str(), msg0->name().length());
        hv_store(hv0, "name", sizeof("name") - 1, sv0, 0);
      }
      if ( msg0->has_value() ) {
        SV * sv0 = newSVpv(msg0->value().c_str(), msg0->value().length());
        hv_store(hv0, "value", sizeof("value") - 1, sv0, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_name(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    RETVAL = THIS->has_name();

  OUTPUT:
    RETVAL


void
clear_name(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    THIS->clear_name();


void
name(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->name().c_str(),
                              THIS->name().length()));
      PUSHs(sv);
    }


void
set_name(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_name(sval);


I32
has_value(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    RETVAL = THIS->has_value();

  OUTPUT:
    RETVAL


void
clear_value(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    THIS->clear_value();


void
value(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->value().c_str(),
                              THIS->value().length()));
      PUSHs(sv);
    }


void
set_value(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Parameter * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_value(sval);


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header
PROTOTYPES: ENABLE


SV *
::sapo_broker::Atom_Header::new (...)
  PREINIT:
    ::sapo_broker::Atom_Header * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_Header;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_Header;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Header * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Header * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Header * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Header * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 1);
    PUSHs(sv_2mortal(newSVpv("parameter",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_Header * msg0 = THIS;

      if ( msg0->parameter_size() > 0 ) {
        AV * av0 = newAV();
        SV * sv0 = newRV_noinc((SV *)av0);
        
        for ( int i0 = 0; i0 < msg0->parameter_size(); i0++ ) {
          ::sapo_broker::Atom_Parameter * msg2 = msg0->mutable_parameter(i0);
          HV * hv2 = newHV();
          SV * sv1 = newRV_noinc((SV *)hv2);
          
          if ( msg2->has_name() ) {
            SV * sv2 = newSVpv(msg2->name().c_str(), msg2->name().length());
            hv_store(hv2, "name", sizeof("name") - 1, sv2, 0);
          }
          if ( msg2->has_value() ) {
            SV * sv2 = newSVpv(msg2->value().c_str(), msg2->value().length());
            hv_store(hv2, "value", sizeof("value") - 1, sv2, 0);
          }
          av_push(av0, sv1);
        }
        hv_store(hv0, "parameter", sizeof("parameter") - 1, sv0, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
parameter_size(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    RETVAL = THIS->parameter_size();

  OUTPUT:
    RETVAL


void
clear_parameter(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    THIS->clear_parameter();


void
parameter(svTHIS, ...)
  SV * svTHIS;
PREINIT:
    SV * sv;
    int index = 0;
    ::sapo_broker::Atom_Parameter * val = NULL;

  PPCODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( items == 2 ) {
      index = SvIV(ST(1));
    } else if ( items > 2 ) {
      croak("Usage: SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header::parameter(CLASS, [index])");
    }
    if ( THIS != NULL ) {
      if ( items == 1 ) {
        int count = THIS->parameter_size();

        EXTEND(SP, count);
        for ( int index = 0; index < count; index++ ) {
          val = new ::sapo_broker::Atom_Parameter;
          val->CopyFrom(THIS->parameter(index));
          sv = sv_newmortal();
          sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter", (void *)val);
          PUSHs(sv);
        }
      } else if ( index >= 0 &&
                  index < THIS->parameter_size() ) {
        EXTEND(SP,1);
        val = new ::sapo_broker::Atom_Parameter;
        val->CopyFrom(THIS->parameter(index));
        sv = sv_newmortal();
        sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter", (void *)val);
        PUSHs(sv);
      } else {
        EXTEND(SP,1);
        PUSHs(&PL_sv_undef);
      }
    }


void
add_parameter(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom_Header * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    ::sapo_broker::Atom_Parameter * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Parameter *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Parameter");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_Parameter * mval = THIS->add_parameter();
      mval->CopyFrom(*VAL);
    }


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage
PROTOTYPES: ENABLE


SV *
::sapo_broker::Atom_BrokerMessage::new (...)
  PREINIT:
    ::sapo_broker::Atom_BrokerMessage * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_BrokerMessage;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_BrokerMessage;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_BrokerMessage * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_BrokerMessage * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_BrokerMessage * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_BrokerMessage * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 4);
    PUSHs(sv_2mortal(newSVpv("message_id",0)));
    PUSHs(sv_2mortal(newSVpv("payload",0)));
    PUSHs(sv_2mortal(newSVpv("expiration",0)));
    PUSHs(sv_2mortal(newSVpv("timestamp",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_BrokerMessage * msg0 = THIS;

      if ( msg0->has_message_id() ) {
        SV * sv0 = newSVpv(msg0->message_id().c_str(), msg0->message_id().length());
        hv_store(hv0, "message_id", sizeof("message_id") - 1, sv0, 0);
      }
      if ( msg0->has_payload() ) {
        SV * sv0 = newSVpv(msg0->payload().c_str(), msg0->payload().length());
        hv_store(hv0, "payload", sizeof("payload") - 1, sv0, 0);
      }
      if ( msg0->has_expiration() ) {
        ostringstream ost0;
        
        ost0 << msg0->expiration();
        SV * sv0 = newSVpv(ost0.str().c_str(), ost0.str().length());
        hv_store(hv0, "expiration", sizeof("expiration") - 1, sv0, 0);
      }
      if ( msg0->has_timestamp() ) {
        ostringstream ost0;
        
        ost0 << msg0->timestamp();
        SV * sv0 = newSVpv(ost0.str().c_str(), ost0.str().length());
        hv_store(hv0, "timestamp", sizeof("timestamp") - 1, sv0, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_message_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    RETVAL = THIS->has_message_id();

  OUTPUT:
    RETVAL


void
clear_message_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    THIS->clear_message_id();


void
message_id(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->message_id().c_str(),
                              THIS->message_id().length()));
      PUSHs(sv);
    }


void
set_message_id(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_message_id(sval);


I32
has_payload(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    RETVAL = THIS->has_payload();

  OUTPUT:
    RETVAL


void
clear_payload(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    THIS->clear_payload();


void
payload(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->payload().c_str(),
                              THIS->payload().length()));
      PUSHs(sv);
    }


void
set_payload(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;

  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    str = SvPV(svVAL, len);
    THIS->set_payload(str, len);


I32
has_expiration(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    RETVAL = THIS->has_expiration();

  OUTPUT:
    RETVAL


void
clear_expiration(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    THIS->clear_expiration();


void
expiration(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ostringstream ost;

  PPCODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      ost.str("");
      ost << THIS->expiration();
      sv = sv_2mortal(newSVpv(ost.str().c_str(),
                              ost.str().length()));
      PUSHs(sv);
    }


void
set_expiration(svTHIS, svVAL)
  SV * svTHIS
  char *svVAL

  PREINIT:
    long long lval;

  CODE:
    lval = strtoll((svVAL) ? svVAL : "", NULL, 0);
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    THIS->set_expiration(lval);


I32
has_timestamp(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    RETVAL = THIS->has_timestamp();

  OUTPUT:
    RETVAL


void
clear_timestamp(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    THIS->clear_timestamp();


void
timestamp(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ostringstream ost;

  PPCODE:
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      ost.str("");
      ost << THIS->timestamp();
      sv = sv_2mortal(newSVpv(ost.str().c_str(),
                              ost.str().length()));
      PUSHs(sv);
    }


void
set_timestamp(svTHIS, svVAL)
  SV * svTHIS
  char *svVAL

  PREINIT:
    long long lval;

  CODE:
    lval = strtoll((svVAL) ? svVAL : "", NULL, 0);
    ::sapo_broker::Atom_BrokerMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    THIS->set_timestamp(lval);


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish
PROTOTYPES: ENABLE


SV *
::sapo_broker::Atom_Publish::new (...)
  PREINIT:
    ::sapo_broker::Atom_Publish * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_Publish;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_Publish;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Publish * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Publish * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Publish * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Publish * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 4);
    PUSHs(sv_2mortal(newSVpv("action_id",0)));
    PUSHs(sv_2mortal(newSVpv("destination_type",0)));
    PUSHs(sv_2mortal(newSVpv("destination",0)));
    PUSHs(sv_2mortal(newSVpv("message",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_Publish * msg0 = THIS;

      if ( msg0->has_action_id() ) {
        SV * sv0 = newSVpv(msg0->action_id().c_str(), msg0->action_id().length());
        hv_store(hv0, "action_id", sizeof("action_id") - 1, sv0, 0);
      }
      if ( msg0->has_destination_type() ) {
        SV * sv0 = newSViv(msg0->destination_type());
        hv_store(hv0, "destination_type", sizeof("destination_type") - 1, sv0, 0);
      }
      if ( msg0->has_destination() ) {
        SV * sv0 = newSVpv(msg0->destination().c_str(), msg0->destination().length());
        hv_store(hv0, "destination", sizeof("destination") - 1, sv0, 0);
      }
      if ( msg0->has_message() ) {
        ::sapo_broker::Atom_BrokerMessage * msg2 = msg0->mutable_message();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->has_message_id() ) {
          SV * sv2 = newSVpv(msg2->message_id().c_str(), msg2->message_id().length());
          hv_store(hv2, "message_id", sizeof("message_id") - 1, sv2, 0);
        }
        if ( msg2->has_payload() ) {
          SV * sv2 = newSVpv(msg2->payload().c_str(), msg2->payload().length());
          hv_store(hv2, "payload", sizeof("payload") - 1, sv2, 0);
        }
        if ( msg2->has_expiration() ) {
          ostringstream ost2;
          
          ost2 << msg2->expiration();
          SV * sv2 = newSVpv(ost2.str().c_str(), ost2.str().length());
          hv_store(hv2, "expiration", sizeof("expiration") - 1, sv2, 0);
        }
        if ( msg2->has_timestamp() ) {
          ostringstream ost2;
          
          ost2 << msg2->timestamp();
          SV * sv2 = newSVpv(ost2.str().c_str(), ost2.str().length());
          hv_store(hv2, "timestamp", sizeof("timestamp") - 1, sv2, 0);
        }
        hv_store(hv0, "message", sizeof("message") - 1, sv1, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    RETVAL = THIS->has_action_id();

  OUTPUT:
    RETVAL


void
clear_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    THIS->clear_action_id();


void
action_id(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->action_id().c_str(),
                              THIS->action_id().length()));
      PUSHs(sv);
    }


void
set_action_id(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_action_id(sval);


I32
has_destination_type(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    RETVAL = THIS->has_destination_type();

  OUTPUT:
    RETVAL


void
clear_destination_type(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    THIS->clear_destination_type();


void
destination_type(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSViv(THIS->destination_type()));
      PUSHs(sv);
    }


void
set_destination_type(svTHIS, svVAL)
  SV * svTHIS
  IV svVAL

  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( ::sapo_broker::Atom_DestinationType_IsValid(svVAL) ) {
      THIS->set_destination_type((::sapo_broker::Atom_DestinationType)svVAL);
    }


I32
has_destination(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    RETVAL = THIS->has_destination();

  OUTPUT:
    RETVAL


void
clear_destination(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    THIS->clear_destination();


void
destination(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->destination().c_str(),
                              THIS->destination().length()));
      PUSHs(sv);
    }


void
set_destination(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_destination(sval);


I32
has_message(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    RETVAL = THIS->has_message();

  OUTPUT:
    RETVAL


void
clear_message(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    THIS->clear_message();


void
message(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_BrokerMessage * val = NULL;

  PPCODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_BrokerMessage;
      val->CopyFrom(THIS->message());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage", (void *)val);
      PUSHs(sv);
    }


void
set_message(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom_Publish * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    ::sapo_broker::Atom_BrokerMessage * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_BrokerMessage * mval = THIS->mutable_message();
      mval->CopyFrom(*VAL);
    }


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll
PROTOTYPES: ENABLE


SV *
::sapo_broker::Atom_Poll::new (...)
  PREINIT:
    ::sapo_broker::Atom_Poll * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_Poll;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_Poll;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Poll * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Poll * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Poll * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Poll * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 3);
    PUSHs(sv_2mortal(newSVpv("action_id",0)));
    PUSHs(sv_2mortal(newSVpv("destination",0)));
    PUSHs(sv_2mortal(newSVpv("timeout",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_Poll * msg0 = THIS;

      if ( msg0->has_action_id() ) {
        SV * sv0 = newSVpv(msg0->action_id().c_str(), msg0->action_id().length());
        hv_store(hv0, "action_id", sizeof("action_id") - 1, sv0, 0);
      }
      if ( msg0->has_destination() ) {
        SV * sv0 = newSVpv(msg0->destination().c_str(), msg0->destination().length());
        hv_store(hv0, "destination", sizeof("destination") - 1, sv0, 0);
      }
      if ( msg0->has_timeout() ) {
        ostringstream ost0;
        
        ost0 << msg0->timeout();
        SV * sv0 = newSVpv(ost0.str().c_str(), ost0.str().length());
        hv_store(hv0, "timeout", sizeof("timeout") - 1, sv0, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    RETVAL = THIS->has_action_id();

  OUTPUT:
    RETVAL


void
clear_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    THIS->clear_action_id();


void
action_id(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->action_id().c_str(),
                              THIS->action_id().length()));
      PUSHs(sv);
    }


void
set_action_id(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_action_id(sval);


I32
has_destination(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    RETVAL = THIS->has_destination();

  OUTPUT:
    RETVAL


void
clear_destination(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    THIS->clear_destination();


void
destination(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->destination().c_str(),
                              THIS->destination().length()));
      PUSHs(sv);
    }


void
set_destination(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_destination(sval);


I32
has_timeout(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    RETVAL = THIS->has_timeout();

  OUTPUT:
    RETVAL


void
clear_timeout(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    THIS->clear_timeout();


void
timeout(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ostringstream ost;

  PPCODE:
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      ost.str("");
      ost << THIS->timeout();
      sv = sv_2mortal(newSVpv(ost.str().c_str(),
                              ost.str().length()));
      PUSHs(sv);
    }


void
set_timeout(svTHIS, svVAL)
  SV * svTHIS
  char *svVAL

  PREINIT:
    long long lval;

  CODE:
    lval = strtoll((svVAL) ? svVAL : "", NULL, 0);
    ::sapo_broker::Atom_Poll * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    THIS->set_timeout(lval);


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted
PROTOTYPES: ENABLE


SV *
::sapo_broker::Atom_Accepted::new (...)
  PREINIT:
    ::sapo_broker::Atom_Accepted * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_Accepted;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_Accepted;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Accepted * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Accepted * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Accepted * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Accepted * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 1);
    PUSHs(sv_2mortal(newSVpv("action_id",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_Accepted * msg0 = THIS;

      if ( msg0->has_action_id() ) {
        SV * sv0 = newSVpv(msg0->action_id().c_str(), msg0->action_id().length());
        hv_store(hv0, "action_id", sizeof("action_id") - 1, sv0, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    RETVAL = THIS->has_action_id();

  OUTPUT:
    RETVAL


void
clear_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    THIS->clear_action_id();


void
action_id(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->action_id().c_str(),
                              THIS->action_id().length()));
      PUSHs(sv);
    }


void
set_action_id(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Accepted * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_action_id(sval);


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage
PROTOTYPES: ENABLE


SV *
::sapo_broker::Atom_AcknowledgeMessage::new (...)
  PREINIT:
    ::sapo_broker::Atom_AcknowledgeMessage * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_AcknowledgeMessage;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_AcknowledgeMessage;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_AcknowledgeMessage * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_AcknowledgeMessage * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_AcknowledgeMessage * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_AcknowledgeMessage * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 3);
    PUSHs(sv_2mortal(newSVpv("action_id",0)));
    PUSHs(sv_2mortal(newSVpv("message_id",0)));
    PUSHs(sv_2mortal(newSVpv("destination",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_AcknowledgeMessage * msg0 = THIS;

      if ( msg0->has_action_id() ) {
        SV * sv0 = newSVpv(msg0->action_id().c_str(), msg0->action_id().length());
        hv_store(hv0, "action_id", sizeof("action_id") - 1, sv0, 0);
      }
      if ( msg0->has_message_id() ) {
        SV * sv0 = newSVpv(msg0->message_id().c_str(), msg0->message_id().length());
        hv_store(hv0, "message_id", sizeof("message_id") - 1, sv0, 0);
      }
      if ( msg0->has_destination() ) {
        SV * sv0 = newSVpv(msg0->destination().c_str(), msg0->destination().length());
        hv_store(hv0, "destination", sizeof("destination") - 1, sv0, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    RETVAL = THIS->has_action_id();

  OUTPUT:
    RETVAL


void
clear_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    THIS->clear_action_id();


void
action_id(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->action_id().c_str(),
                              THIS->action_id().length()));
      PUSHs(sv);
    }


void
set_action_id(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_action_id(sval);


I32
has_message_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    RETVAL = THIS->has_message_id();

  OUTPUT:
    RETVAL


void
clear_message_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    THIS->clear_message_id();


void
message_id(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->message_id().c_str(),
                              THIS->message_id().length()));
      PUSHs(sv);
    }


void
set_message_id(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_message_id(sval);


I32
has_destination(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    RETVAL = THIS->has_destination();

  OUTPUT:
    RETVAL


void
clear_destination(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    THIS->clear_destination();


void
destination(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->destination().c_str(),
                              THIS->destination().length()));
      PUSHs(sv);
    }


void
set_destination(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_AcknowledgeMessage * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_destination(sval);


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe
PROTOTYPES: ENABLE


SV *
::sapo_broker::Atom_Subscribe::new (...)
  PREINIT:
    ::sapo_broker::Atom_Subscribe * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_Subscribe;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_Subscribe;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Subscribe * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Subscribe * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Subscribe * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Subscribe * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 3);
    PUSHs(sv_2mortal(newSVpv("action_id",0)));
    PUSHs(sv_2mortal(newSVpv("destination",0)));
    PUSHs(sv_2mortal(newSVpv("destination_type",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_Subscribe * msg0 = THIS;

      if ( msg0->has_action_id() ) {
        SV * sv0 = newSVpv(msg0->action_id().c_str(), msg0->action_id().length());
        hv_store(hv0, "action_id", sizeof("action_id") - 1, sv0, 0);
      }
      if ( msg0->has_destination() ) {
        SV * sv0 = newSVpv(msg0->destination().c_str(), msg0->destination().length());
        hv_store(hv0, "destination", sizeof("destination") - 1, sv0, 0);
      }
      if ( msg0->has_destination_type() ) {
        SV * sv0 = newSViv(msg0->destination_type());
        hv_store(hv0, "destination_type", sizeof("destination_type") - 1, sv0, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    RETVAL = THIS->has_action_id();

  OUTPUT:
    RETVAL


void
clear_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    THIS->clear_action_id();


void
action_id(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->action_id().c_str(),
                              THIS->action_id().length()));
      PUSHs(sv);
    }


void
set_action_id(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_action_id(sval);


I32
has_destination(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    RETVAL = THIS->has_destination();

  OUTPUT:
    RETVAL


void
clear_destination(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    THIS->clear_destination();


void
destination(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->destination().c_str(),
                              THIS->destination().length()));
      PUSHs(sv);
    }


void
set_destination(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_destination(sval);


I32
has_destination_type(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    RETVAL = THIS->has_destination_type();

  OUTPUT:
    RETVAL


void
clear_destination_type(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    THIS->clear_destination_type();


void
destination_type(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSViv(THIS->destination_type()));
      PUSHs(sv);
    }


void
set_destination_type(svTHIS, svVAL)
  SV * svTHIS
  IV svVAL

  CODE:
    ::sapo_broker::Atom_Subscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( ::sapo_broker::Atom_DestinationType_IsValid(svVAL) ) {
      THIS->set_destination_type((::sapo_broker::Atom_DestinationType)svVAL);
    }


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe
PROTOTYPES: ENABLE


SV *
::sapo_broker::Atom_Unsubscribe::new (...)
  PREINIT:
    ::sapo_broker::Atom_Unsubscribe * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_Unsubscribe;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_Unsubscribe;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Unsubscribe * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Unsubscribe * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Unsubscribe * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Unsubscribe * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 3);
    PUSHs(sv_2mortal(newSVpv("action_id",0)));
    PUSHs(sv_2mortal(newSVpv("destination",0)));
    PUSHs(sv_2mortal(newSVpv("destination_type",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_Unsubscribe * msg0 = THIS;

      if ( msg0->has_action_id() ) {
        SV * sv0 = newSVpv(msg0->action_id().c_str(), msg0->action_id().length());
        hv_store(hv0, "action_id", sizeof("action_id") - 1, sv0, 0);
      }
      if ( msg0->has_destination() ) {
        SV * sv0 = newSVpv(msg0->destination().c_str(), msg0->destination().length());
        hv_store(hv0, "destination", sizeof("destination") - 1, sv0, 0);
      }
      if ( msg0->has_destination_type() ) {
        SV * sv0 = newSViv(msg0->destination_type());
        hv_store(hv0, "destination_type", sizeof("destination_type") - 1, sv0, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    RETVAL = THIS->has_action_id();

  OUTPUT:
    RETVAL


void
clear_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    THIS->clear_action_id();


void
action_id(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->action_id().c_str(),
                              THIS->action_id().length()));
      PUSHs(sv);
    }


void
set_action_id(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_action_id(sval);


I32
has_destination(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    RETVAL = THIS->has_destination();

  OUTPUT:
    RETVAL


void
clear_destination(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    THIS->clear_destination();


void
destination(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->destination().c_str(),
                              THIS->destination().length()));
      PUSHs(sv);
    }


void
set_destination(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_destination(sval);


I32
has_destination_type(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    RETVAL = THIS->has_destination_type();

  OUTPUT:
    RETVAL


void
clear_destination_type(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    THIS->clear_destination_type();


void
destination_type(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSViv(THIS->destination_type()));
      PUSHs(sv);
    }


void
set_destination_type(svTHIS, svVAL)
  SV * svTHIS
  IV svVAL

  CODE:
    ::sapo_broker::Atom_Unsubscribe * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( ::sapo_broker::Atom_DestinationType_IsValid(svVAL) ) {
      THIS->set_destination_type((::sapo_broker::Atom_DestinationType)svVAL);
    }


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification
PROTOTYPES: ENABLE


SV *
::sapo_broker::Atom_Notification::new (...)
  PREINIT:
    ::sapo_broker::Atom_Notification * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_Notification;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_Notification;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Notification * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Notification * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Notification * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Notification * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 4);
    PUSHs(sv_2mortal(newSVpv("destination",0)));
    PUSHs(sv_2mortal(newSVpv("subscription",0)));
    PUSHs(sv_2mortal(newSVpv("destination_type",0)));
    PUSHs(sv_2mortal(newSVpv("message",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_Notification * msg0 = THIS;

      if ( msg0->has_destination() ) {
        SV * sv0 = newSVpv(msg0->destination().c_str(), msg0->destination().length());
        hv_store(hv0, "destination", sizeof("destination") - 1, sv0, 0);
      }
      if ( msg0->has_subscription() ) {
        SV * sv0 = newSVpv(msg0->subscription().c_str(), msg0->subscription().length());
        hv_store(hv0, "subscription", sizeof("subscription") - 1, sv0, 0);
      }
      if ( msg0->has_destination_type() ) {
        SV * sv0 = newSViv(msg0->destination_type());
        hv_store(hv0, "destination_type", sizeof("destination_type") - 1, sv0, 0);
      }
      if ( msg0->has_message() ) {
        ::sapo_broker::Atom_BrokerMessage * msg2 = msg0->mutable_message();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->has_message_id() ) {
          SV * sv2 = newSVpv(msg2->message_id().c_str(), msg2->message_id().length());
          hv_store(hv2, "message_id", sizeof("message_id") - 1, sv2, 0);
        }
        if ( msg2->has_payload() ) {
          SV * sv2 = newSVpv(msg2->payload().c_str(), msg2->payload().length());
          hv_store(hv2, "payload", sizeof("payload") - 1, sv2, 0);
        }
        if ( msg2->has_expiration() ) {
          ostringstream ost2;
          
          ost2 << msg2->expiration();
          SV * sv2 = newSVpv(ost2.str().c_str(), ost2.str().length());
          hv_store(hv2, "expiration", sizeof("expiration") - 1, sv2, 0);
        }
        if ( msg2->has_timestamp() ) {
          ostringstream ost2;
          
          ost2 << msg2->timestamp();
          SV * sv2 = newSVpv(ost2.str().c_str(), ost2.str().length());
          hv_store(hv2, "timestamp", sizeof("timestamp") - 1, sv2, 0);
        }
        hv_store(hv0, "message", sizeof("message") - 1, sv1, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_destination(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    RETVAL = THIS->has_destination();

  OUTPUT:
    RETVAL


void
clear_destination(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    THIS->clear_destination();


void
destination(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->destination().c_str(),
                              THIS->destination().length()));
      PUSHs(sv);
    }


void
set_destination(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_destination(sval);


I32
has_subscription(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    RETVAL = THIS->has_subscription();

  OUTPUT:
    RETVAL


void
clear_subscription(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    THIS->clear_subscription();


void
subscription(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->subscription().c_str(),
                              THIS->subscription().length()));
      PUSHs(sv);
    }


void
set_subscription(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_subscription(sval);


I32
has_destination_type(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    RETVAL = THIS->has_destination_type();

  OUTPUT:
    RETVAL


void
clear_destination_type(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    THIS->clear_destination_type();


void
destination_type(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSViv(THIS->destination_type()));
      PUSHs(sv);
    }


void
set_destination_type(svTHIS, svVAL)
  SV * svTHIS
  IV svVAL

  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( ::sapo_broker::Atom_DestinationType_IsValid(svVAL) ) {
      THIS->set_destination_type((::sapo_broker::Atom_DestinationType)svVAL);
    }


I32
has_message(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    RETVAL = THIS->has_message();

  OUTPUT:
    RETVAL


void
clear_message(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    THIS->clear_message();


void
message(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_BrokerMessage * val = NULL;

  PPCODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_BrokerMessage;
      val->CopyFrom(THIS->message());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage", (void *)val);
      PUSHs(sv);
    }


void
set_message(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom_Notification * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    ::sapo_broker::Atom_BrokerMessage * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_BrokerMessage *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::BrokerMessage");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_BrokerMessage * mval = THIS->mutable_message();
      mval->CopyFrom(*VAL);
    }


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault
PROTOTYPES: ENABLE


SV *
::sapo_broker::Atom_Fault::new (...)
  PREINIT:
    ::sapo_broker::Atom_Fault * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_Fault;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_Fault;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Fault * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Fault * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Fault * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Fault * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 4);
    PUSHs(sv_2mortal(newSVpv("action_id",0)));
    PUSHs(sv_2mortal(newSVpv("fault_code",0)));
    PUSHs(sv_2mortal(newSVpv("fault_message",0)));
    PUSHs(sv_2mortal(newSVpv("fault_detail",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_Fault * msg0 = THIS;

      if ( msg0->has_action_id() ) {
        SV * sv0 = newSVpv(msg0->action_id().c_str(), msg0->action_id().length());
        hv_store(hv0, "action_id", sizeof("action_id") - 1, sv0, 0);
      }
      if ( msg0->has_fault_code() ) {
        SV * sv0 = newSVpv(msg0->fault_code().c_str(), msg0->fault_code().length());
        hv_store(hv0, "fault_code", sizeof("fault_code") - 1, sv0, 0);
      }
      if ( msg0->has_fault_message() ) {
        SV * sv0 = newSVpv(msg0->fault_message().c_str(), msg0->fault_message().length());
        hv_store(hv0, "fault_message", sizeof("fault_message") - 1, sv0, 0);
      }
      if ( msg0->has_fault_detail() ) {
        SV * sv0 = newSVpv(msg0->fault_detail().c_str(), msg0->fault_detail().length());
        hv_store(hv0, "fault_detail", sizeof("fault_detail") - 1, sv0, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    RETVAL = THIS->has_action_id();

  OUTPUT:
    RETVAL


void
clear_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    THIS->clear_action_id();


void
action_id(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->action_id().c_str(),
                              THIS->action_id().length()));
      PUSHs(sv);
    }


void
set_action_id(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_action_id(sval);


I32
has_fault_code(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    RETVAL = THIS->has_fault_code();

  OUTPUT:
    RETVAL


void
clear_fault_code(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    THIS->clear_fault_code();


void
fault_code(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->fault_code().c_str(),
                              THIS->fault_code().length()));
      PUSHs(sv);
    }


void
set_fault_code(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_fault_code(sval);


I32
has_fault_message(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    RETVAL = THIS->has_fault_message();

  OUTPUT:
    RETVAL


void
clear_fault_message(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    THIS->clear_fault_message();


void
fault_message(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->fault_message().c_str(),
                              THIS->fault_message().length()));
      PUSHs(sv);
    }


void
set_fault_message(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_fault_message(sval);


I32
has_fault_detail(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    RETVAL = THIS->has_fault_detail();

  OUTPUT:
    RETVAL


void
clear_fault_detail(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    THIS->clear_fault_detail();


void
fault_detail(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->fault_detail().c_str(),
                              THIS->fault_detail().length()));
      PUSHs(sv);
    }


void
set_fault_detail(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Fault * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_fault_detail(sval);


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping
PROTOTYPES: ENABLE


SV *
::sapo_broker::Atom_Ping::new (...)
  PREINIT:
    ::sapo_broker::Atom_Ping * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_Ping;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_Ping;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Ping * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Ping * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Ping * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Ping * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 1);
    PUSHs(sv_2mortal(newSVpv("action_id",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_Ping * msg0 = THIS;

      if ( msg0->has_action_id() ) {
        SV * sv0 = newSVpv(msg0->action_id().c_str(), msg0->action_id().length());
        hv_store(hv0, "action_id", sizeof("action_id") - 1, sv0, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    RETVAL = THIS->has_action_id();

  OUTPUT:
    RETVAL


void
clear_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    THIS->clear_action_id();


void
action_id(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->action_id().c_str(),
                              THIS->action_id().length()));
      PUSHs(sv);
    }


void
set_action_id(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Ping * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_action_id(sval);


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong
PROTOTYPES: ENABLE


SV *
::sapo_broker::Atom_Pong::new (...)
  PREINIT:
    ::sapo_broker::Atom_Pong * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_Pong;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_Pong;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Pong * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Pong * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Pong * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Pong * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 1);
    PUSHs(sv_2mortal(newSVpv("action_id",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_Pong * msg0 = THIS;

      if ( msg0->has_action_id() ) {
        SV * sv0 = newSVpv(msg0->action_id().c_str(), msg0->action_id().length());
        hv_store(hv0, "action_id", sizeof("action_id") - 1, sv0, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    RETVAL = THIS->has_action_id();

  OUTPUT:
    RETVAL


void
clear_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    THIS->clear_action_id();


void
action_id(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->action_id().c_str(),
                              THIS->action_id().length()));
      PUSHs(sv);
    }


void
set_action_id(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Pong * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_action_id(sval);


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication
PROTOTYPES: ENABLE


SV *
::sapo_broker::Atom_Authentication::new (...)
  PREINIT:
    ::sapo_broker::Atom_Authentication * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_Authentication;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_Authentication;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Authentication * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Authentication * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Authentication * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Authentication * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 5);
    PUSHs(sv_2mortal(newSVpv("action_id",0)));
    PUSHs(sv_2mortal(newSVpv("authentication_type",0)));
    PUSHs(sv_2mortal(newSVpv("token",0)));
    PUSHs(sv_2mortal(newSVpv("user_id",0)));
    PUSHs(sv_2mortal(newSVpv("role",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_Authentication * msg0 = THIS;

      if ( msg0->has_action_id() ) {
        SV * sv0 = newSVpv(msg0->action_id().c_str(), msg0->action_id().length());
        hv_store(hv0, "action_id", sizeof("action_id") - 1, sv0, 0);
      }
      if ( msg0->has_authentication_type() ) {
        SV * sv0 = newSVpv(msg0->authentication_type().c_str(), msg0->authentication_type().length());
        hv_store(hv0, "authentication_type", sizeof("authentication_type") - 1, sv0, 0);
      }
      if ( msg0->has_token() ) {
        SV * sv0 = newSVpv(msg0->token().c_str(), msg0->token().length());
        hv_store(hv0, "token", sizeof("token") - 1, sv0, 0);
      }
      if ( msg0->has_user_id() ) {
        SV * sv0 = newSVpv(msg0->user_id().c_str(), msg0->user_id().length());
        hv_store(hv0, "user_id", sizeof("user_id") - 1, sv0, 0);
      }
      if ( msg0->role_size() > 0 ) {
        AV * av0 = newAV();
        SV * sv0 = newRV_noinc((SV *)av0);
        
        for ( int i0 = 0; i0 < msg0->role_size(); i0++ ) {
          SV * sv1 = newSVpv(msg0->role(i0).c_str(), msg0->role(i0).length());
          av_push(av0, sv1);
        }
        hv_store(hv0, "role", sizeof("role") - 1, sv0, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    RETVAL = THIS->has_action_id();

  OUTPUT:
    RETVAL


void
clear_action_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    THIS->clear_action_id();


void
action_id(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->action_id().c_str(),
                              THIS->action_id().length()));
      PUSHs(sv);
    }


void
set_action_id(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_action_id(sval);


I32
has_authentication_type(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    RETVAL = THIS->has_authentication_type();

  OUTPUT:
    RETVAL


void
clear_authentication_type(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    THIS->clear_authentication_type();


void
authentication_type(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->authentication_type().c_str(),
                              THIS->authentication_type().length()));
      PUSHs(sv);
    }


void
set_authentication_type(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_authentication_type(sval);


I32
has_token(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    RETVAL = THIS->has_token();

  OUTPUT:
    RETVAL


void
clear_token(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    THIS->clear_token();


void
token(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->token().c_str(),
                              THIS->token().length()));
      PUSHs(sv);
    }


void
set_token(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;

  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    str = SvPV(svVAL, len);
    THIS->set_token(str, len);


I32
has_user_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    RETVAL = THIS->has_user_id();

  OUTPUT:
    RETVAL


void
clear_user_id(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    THIS->clear_user_id();


void
user_id(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSVpv(THIS->user_id().c_str(),
                              THIS->user_id().length()));
      PUSHs(sv);
    }


void
set_user_id(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->set_user_id(sval);


I32
role_size(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    RETVAL = THIS->role_size();

  OUTPUT:
    RETVAL


void
clear_role(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    THIS->clear_role();


void
role(svTHIS, ...)
  SV * svTHIS;
PREINIT:
    SV * sv;
    int index = 0;

  PPCODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( items == 2 ) {
      index = SvIV(ST(1));
    } else if ( items > 2 ) {
      croak("Usage: SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication::role(CLASS, [index])");
    }
    if ( THIS != NULL ) {
      if ( items == 1 ) {
        int count = THIS->role_size();

        EXTEND(SP, count);
        for ( int index = 0; index < count; index++ ) {
          sv = sv_2mortal(newSVpv(THIS->role(index).c_str(),
                                  THIS->role(index).length()));
          PUSHs(sv);
        }
      } else if ( index >= 0 &&
                  index < THIS->role_size() ) {
        EXTEND(SP,1);
        sv = sv_2mortal(newSVpv(THIS->role(index).c_str(),
                                THIS->role(index).length()));
        PUSHs(sv);
      } else {
        EXTEND(SP,1);
        PUSHs(&PL_sv_undef);
      }
    }


void
add_role(svTHIS, svVAL)
  SV * svTHIS
  SV *svVAL

  PREINIT:
    char * str;
    STRLEN len;
    string sval;

  CODE:
    ::sapo_broker::Atom_Authentication * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    str = SvPV(svVAL, len);
    sval.assign(str, len);
    THIS->add_role(sval);


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action
PROTOTYPES: ENABLE


BOOT:
  {
    HV * stash;

    stash = gv_stashpv("SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action::ActionType", TRUE);
    newCONSTSUB(stash, "PUBLISH", newSViv(::sapo_broker::Atom_Action::PUBLISH));
    newCONSTSUB(stash, "POLL", newSViv(::sapo_broker::Atom_Action::POLL));
    newCONSTSUB(stash, "ACCEPTED", newSViv(::sapo_broker::Atom_Action::ACCEPTED));
    newCONSTSUB(stash, "ACKNOWLEDGE_MESSAGE", newSViv(::sapo_broker::Atom_Action::ACKNOWLEDGE_MESSAGE));
    newCONSTSUB(stash, "SUBSCRIBE", newSViv(::sapo_broker::Atom_Action::SUBSCRIBE));
    newCONSTSUB(stash, "UNSUBSCRIBE", newSViv(::sapo_broker::Atom_Action::UNSUBSCRIBE));
    newCONSTSUB(stash, "NOTIFICATION", newSViv(::sapo_broker::Atom_Action::NOTIFICATION));
    newCONSTSUB(stash, "FAULT", newSViv(::sapo_broker::Atom_Action::FAULT));
    newCONSTSUB(stash, "PING", newSViv(::sapo_broker::Atom_Action::PING));
    newCONSTSUB(stash, "PONG", newSViv(::sapo_broker::Atom_Action::PONG));
    newCONSTSUB(stash, "AUTH", newSViv(::sapo_broker::Atom_Action::AUTH));
  }


SV *
::sapo_broker::Atom_Action::new (...)
  PREINIT:
    ::sapo_broker::Atom_Action * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom_Action;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom_Action;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Action * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Action * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom_Action * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom_Action * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 12);
    PUSHs(sv_2mortal(newSVpv("publish",0)));
    PUSHs(sv_2mortal(newSVpv("poll",0)));
    PUSHs(sv_2mortal(newSVpv("accepted",0)));
    PUSHs(sv_2mortal(newSVpv("ack_message",0)));
    PUSHs(sv_2mortal(newSVpv("subscribe",0)));
    PUSHs(sv_2mortal(newSVpv("unsubscribe",0)));
    PUSHs(sv_2mortal(newSVpv("notification",0)));
    PUSHs(sv_2mortal(newSVpv("fault",0)));
    PUSHs(sv_2mortal(newSVpv("ping",0)));
    PUSHs(sv_2mortal(newSVpv("pong",0)));
    PUSHs(sv_2mortal(newSVpv("auth",0)));
    PUSHs(sv_2mortal(newSVpv("action_type",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom_Action * msg0 = THIS;

      if ( msg0->has_publish() ) {
        ::sapo_broker::Atom_Publish * msg2 = msg0->mutable_publish();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->has_action_id() ) {
          SV * sv2 = newSVpv(msg2->action_id().c_str(), msg2->action_id().length());
          hv_store(hv2, "action_id", sizeof("action_id") - 1, sv2, 0);
        }
        if ( msg2->has_destination_type() ) {
          SV * sv2 = newSViv(msg2->destination_type());
          hv_store(hv2, "destination_type", sizeof("destination_type") - 1, sv2, 0);
        }
        if ( msg2->has_destination() ) {
          SV * sv2 = newSVpv(msg2->destination().c_str(), msg2->destination().length());
          hv_store(hv2, "destination", sizeof("destination") - 1, sv2, 0);
        }
        if ( msg2->has_message() ) {
          ::sapo_broker::Atom_BrokerMessage * msg4 = msg2->mutable_message();
          HV * hv4 = newHV();
          SV * sv3 = newRV_noinc((SV *)hv4);
          
          if ( msg4->has_message_id() ) {
            SV * sv4 = newSVpv(msg4->message_id().c_str(), msg4->message_id().length());
            hv_store(hv4, "message_id", sizeof("message_id") - 1, sv4, 0);
          }
          if ( msg4->has_payload() ) {
            SV * sv4 = newSVpv(msg4->payload().c_str(), msg4->payload().length());
            hv_store(hv4, "payload", sizeof("payload") - 1, sv4, 0);
          }
          if ( msg4->has_expiration() ) {
            ostringstream ost4;
            
            ost4 << msg4->expiration();
            SV * sv4 = newSVpv(ost4.str().c_str(), ost4.str().length());
            hv_store(hv4, "expiration", sizeof("expiration") - 1, sv4, 0);
          }
          if ( msg4->has_timestamp() ) {
            ostringstream ost4;
            
            ost4 << msg4->timestamp();
            SV * sv4 = newSVpv(ost4.str().c_str(), ost4.str().length());
            hv_store(hv4, "timestamp", sizeof("timestamp") - 1, sv4, 0);
          }
          hv_store(hv2, "message", sizeof("message") - 1, sv3, 0);
        }
        hv_store(hv0, "publish", sizeof("publish") - 1, sv1, 0);
      }
      if ( msg0->has_poll() ) {
        ::sapo_broker::Atom_Poll * msg2 = msg0->mutable_poll();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->has_action_id() ) {
          SV * sv2 = newSVpv(msg2->action_id().c_str(), msg2->action_id().length());
          hv_store(hv2, "action_id", sizeof("action_id") - 1, sv2, 0);
        }
        if ( msg2->has_destination() ) {
          SV * sv2 = newSVpv(msg2->destination().c_str(), msg2->destination().length());
          hv_store(hv2, "destination", sizeof("destination") - 1, sv2, 0);
        }
        if ( msg2->has_timeout() ) {
          ostringstream ost2;
          
          ost2 << msg2->timeout();
          SV * sv2 = newSVpv(ost2.str().c_str(), ost2.str().length());
          hv_store(hv2, "timeout", sizeof("timeout") - 1, sv2, 0);
        }
        hv_store(hv0, "poll", sizeof("poll") - 1, sv1, 0);
      }
      if ( msg0->has_accepted() ) {
        ::sapo_broker::Atom_Accepted * msg2 = msg0->mutable_accepted();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->has_action_id() ) {
          SV * sv2 = newSVpv(msg2->action_id().c_str(), msg2->action_id().length());
          hv_store(hv2, "action_id", sizeof("action_id") - 1, sv2, 0);
        }
        hv_store(hv0, "accepted", sizeof("accepted") - 1, sv1, 0);
      }
      if ( msg0->has_ack_message() ) {
        ::sapo_broker::Atom_AcknowledgeMessage * msg2 = msg0->mutable_ack_message();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->has_action_id() ) {
          SV * sv2 = newSVpv(msg2->action_id().c_str(), msg2->action_id().length());
          hv_store(hv2, "action_id", sizeof("action_id") - 1, sv2, 0);
        }
        if ( msg2->has_message_id() ) {
          SV * sv2 = newSVpv(msg2->message_id().c_str(), msg2->message_id().length());
          hv_store(hv2, "message_id", sizeof("message_id") - 1, sv2, 0);
        }
        if ( msg2->has_destination() ) {
          SV * sv2 = newSVpv(msg2->destination().c_str(), msg2->destination().length());
          hv_store(hv2, "destination", sizeof("destination") - 1, sv2, 0);
        }
        hv_store(hv0, "ack_message", sizeof("ack_message") - 1, sv1, 0);
      }
      if ( msg0->has_subscribe() ) {
        ::sapo_broker::Atom_Subscribe * msg2 = msg0->mutable_subscribe();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->has_action_id() ) {
          SV * sv2 = newSVpv(msg2->action_id().c_str(), msg2->action_id().length());
          hv_store(hv2, "action_id", sizeof("action_id") - 1, sv2, 0);
        }
        if ( msg2->has_destination() ) {
          SV * sv2 = newSVpv(msg2->destination().c_str(), msg2->destination().length());
          hv_store(hv2, "destination", sizeof("destination") - 1, sv2, 0);
        }
        if ( msg2->has_destination_type() ) {
          SV * sv2 = newSViv(msg2->destination_type());
          hv_store(hv2, "destination_type", sizeof("destination_type") - 1, sv2, 0);
        }
        hv_store(hv0, "subscribe", sizeof("subscribe") - 1, sv1, 0);
      }
      if ( msg0->has_unsubscribe() ) {
        ::sapo_broker::Atom_Unsubscribe * msg2 = msg0->mutable_unsubscribe();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->has_action_id() ) {
          SV * sv2 = newSVpv(msg2->action_id().c_str(), msg2->action_id().length());
          hv_store(hv2, "action_id", sizeof("action_id") - 1, sv2, 0);
        }
        if ( msg2->has_destination() ) {
          SV * sv2 = newSVpv(msg2->destination().c_str(), msg2->destination().length());
          hv_store(hv2, "destination", sizeof("destination") - 1, sv2, 0);
        }
        if ( msg2->has_destination_type() ) {
          SV * sv2 = newSViv(msg2->destination_type());
          hv_store(hv2, "destination_type", sizeof("destination_type") - 1, sv2, 0);
        }
        hv_store(hv0, "unsubscribe", sizeof("unsubscribe") - 1, sv1, 0);
      }
      if ( msg0->has_notification() ) {
        ::sapo_broker::Atom_Notification * msg2 = msg0->mutable_notification();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->has_destination() ) {
          SV * sv2 = newSVpv(msg2->destination().c_str(), msg2->destination().length());
          hv_store(hv2, "destination", sizeof("destination") - 1, sv2, 0);
        }
        if ( msg2->has_subscription() ) {
          SV * sv2 = newSVpv(msg2->subscription().c_str(), msg2->subscription().length());
          hv_store(hv2, "subscription", sizeof("subscription") - 1, sv2, 0);
        }
        if ( msg2->has_destination_type() ) {
          SV * sv2 = newSViv(msg2->destination_type());
          hv_store(hv2, "destination_type", sizeof("destination_type") - 1, sv2, 0);
        }
        if ( msg2->has_message() ) {
          ::sapo_broker::Atom_BrokerMessage * msg4 = msg2->mutable_message();
          HV * hv4 = newHV();
          SV * sv3 = newRV_noinc((SV *)hv4);
          
          if ( msg4->has_message_id() ) {
            SV * sv4 = newSVpv(msg4->message_id().c_str(), msg4->message_id().length());
            hv_store(hv4, "message_id", sizeof("message_id") - 1, sv4, 0);
          }
          if ( msg4->has_payload() ) {
            SV * sv4 = newSVpv(msg4->payload().c_str(), msg4->payload().length());
            hv_store(hv4, "payload", sizeof("payload") - 1, sv4, 0);
          }
          if ( msg4->has_expiration() ) {
            ostringstream ost4;
            
            ost4 << msg4->expiration();
            SV * sv4 = newSVpv(ost4.str().c_str(), ost4.str().length());
            hv_store(hv4, "expiration", sizeof("expiration") - 1, sv4, 0);
          }
          if ( msg4->has_timestamp() ) {
            ostringstream ost4;
            
            ost4 << msg4->timestamp();
            SV * sv4 = newSVpv(ost4.str().c_str(), ost4.str().length());
            hv_store(hv4, "timestamp", sizeof("timestamp") - 1, sv4, 0);
          }
          hv_store(hv2, "message", sizeof("message") - 1, sv3, 0);
        }
        hv_store(hv0, "notification", sizeof("notification") - 1, sv1, 0);
      }
      if ( msg0->has_fault() ) {
        ::sapo_broker::Atom_Fault * msg2 = msg0->mutable_fault();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->has_action_id() ) {
          SV * sv2 = newSVpv(msg2->action_id().c_str(), msg2->action_id().length());
          hv_store(hv2, "action_id", sizeof("action_id") - 1, sv2, 0);
        }
        if ( msg2->has_fault_code() ) {
          SV * sv2 = newSVpv(msg2->fault_code().c_str(), msg2->fault_code().length());
          hv_store(hv2, "fault_code", sizeof("fault_code") - 1, sv2, 0);
        }
        if ( msg2->has_fault_message() ) {
          SV * sv2 = newSVpv(msg2->fault_message().c_str(), msg2->fault_message().length());
          hv_store(hv2, "fault_message", sizeof("fault_message") - 1, sv2, 0);
        }
        if ( msg2->has_fault_detail() ) {
          SV * sv2 = newSVpv(msg2->fault_detail().c_str(), msg2->fault_detail().length());
          hv_store(hv2, "fault_detail", sizeof("fault_detail") - 1, sv2, 0);
        }
        hv_store(hv0, "fault", sizeof("fault") - 1, sv1, 0);
      }
      if ( msg0->has_ping() ) {
        ::sapo_broker::Atom_Ping * msg2 = msg0->mutable_ping();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->has_action_id() ) {
          SV * sv2 = newSVpv(msg2->action_id().c_str(), msg2->action_id().length());
          hv_store(hv2, "action_id", sizeof("action_id") - 1, sv2, 0);
        }
        hv_store(hv0, "ping", sizeof("ping") - 1, sv1, 0);
      }
      if ( msg0->has_pong() ) {
        ::sapo_broker::Atom_Pong * msg2 = msg0->mutable_pong();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->has_action_id() ) {
          SV * sv2 = newSVpv(msg2->action_id().c_str(), msg2->action_id().length());
          hv_store(hv2, "action_id", sizeof("action_id") - 1, sv2, 0);
        }
        hv_store(hv0, "pong", sizeof("pong") - 1, sv1, 0);
      }
      if ( msg0->has_auth() ) {
        ::sapo_broker::Atom_Authentication * msg2 = msg0->mutable_auth();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->has_action_id() ) {
          SV * sv2 = newSVpv(msg2->action_id().c_str(), msg2->action_id().length());
          hv_store(hv2, "action_id", sizeof("action_id") - 1, sv2, 0);
        }
        if ( msg2->has_authentication_type() ) {
          SV * sv2 = newSVpv(msg2->authentication_type().c_str(), msg2->authentication_type().length());
          hv_store(hv2, "authentication_type", sizeof("authentication_type") - 1, sv2, 0);
        }
        if ( msg2->has_token() ) {
          SV * sv2 = newSVpv(msg2->token().c_str(), msg2->token().length());
          hv_store(hv2, "token", sizeof("token") - 1, sv2, 0);
        }
        if ( msg2->has_user_id() ) {
          SV * sv2 = newSVpv(msg2->user_id().c_str(), msg2->user_id().length());
          hv_store(hv2, "user_id", sizeof("user_id") - 1, sv2, 0);
        }
        if ( msg2->role_size() > 0 ) {
          AV * av2 = newAV();
          SV * sv2 = newRV_noinc((SV *)av2);
          
          for ( int i2 = 0; i2 < msg2->role_size(); i2++ ) {
            SV * sv3 = newSVpv(msg2->role(i2).c_str(), msg2->role(i2).length());
            av_push(av2, sv3);
          }
          hv_store(hv2, "role", sizeof("role") - 1, sv2, 0);
        }
        hv_store(hv0, "auth", sizeof("auth") - 1, sv1, 0);
      }
      if ( msg0->has_action_type() ) {
        SV * sv0 = newSViv(msg0->action_type());
        hv_store(hv0, "action_type", sizeof("action_type") - 1, sv0, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_publish(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    RETVAL = THIS->has_publish();

  OUTPUT:
    RETVAL


void
clear_publish(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    THIS->clear_publish();


void
publish(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_Publish * val = NULL;

  PPCODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_Publish;
      val->CopyFrom(THIS->publish());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish", (void *)val);
      PUSHs(sv);
    }


void
set_publish(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    ::sapo_broker::Atom_Publish * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Publish *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Publish");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_Publish * mval = THIS->mutable_publish();
      mval->CopyFrom(*VAL);
    }


I32
has_poll(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    RETVAL = THIS->has_poll();

  OUTPUT:
    RETVAL


void
clear_poll(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    THIS->clear_poll();


void
poll(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_Poll * val = NULL;

  PPCODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_Poll;
      val->CopyFrom(THIS->poll());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll", (void *)val);
      PUSHs(sv);
    }


void
set_poll(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    ::sapo_broker::Atom_Poll * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Poll *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Poll");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_Poll * mval = THIS->mutable_poll();
      mval->CopyFrom(*VAL);
    }


I32
has_accepted(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    RETVAL = THIS->has_accepted();

  OUTPUT:
    RETVAL


void
clear_accepted(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    THIS->clear_accepted();


void
accepted(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_Accepted * val = NULL;

  PPCODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_Accepted;
      val->CopyFrom(THIS->accepted());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted", (void *)val);
      PUSHs(sv);
    }


void
set_accepted(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    ::sapo_broker::Atom_Accepted * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Accepted *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Accepted");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_Accepted * mval = THIS->mutable_accepted();
      mval->CopyFrom(*VAL);
    }


I32
has_ack_message(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    RETVAL = THIS->has_ack_message();

  OUTPUT:
    RETVAL


void
clear_ack_message(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    THIS->clear_ack_message();


void
ack_message(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_AcknowledgeMessage * val = NULL;

  PPCODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_AcknowledgeMessage;
      val->CopyFrom(THIS->ack_message());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage", (void *)val);
      PUSHs(sv);
    }


void
set_ack_message(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    ::sapo_broker::Atom_AcknowledgeMessage * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_AcknowledgeMessage *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::AcknowledgeMessage");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_AcknowledgeMessage * mval = THIS->mutable_ack_message();
      mval->CopyFrom(*VAL);
    }


I32
has_subscribe(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    RETVAL = THIS->has_subscribe();

  OUTPUT:
    RETVAL


void
clear_subscribe(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    THIS->clear_subscribe();


void
subscribe(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_Subscribe * val = NULL;

  PPCODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_Subscribe;
      val->CopyFrom(THIS->subscribe());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe", (void *)val);
      PUSHs(sv);
    }


void
set_subscribe(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    ::sapo_broker::Atom_Subscribe * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Subscribe *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Subscribe");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_Subscribe * mval = THIS->mutable_subscribe();
      mval->CopyFrom(*VAL);
    }


I32
has_unsubscribe(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    RETVAL = THIS->has_unsubscribe();

  OUTPUT:
    RETVAL


void
clear_unsubscribe(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    THIS->clear_unsubscribe();


void
unsubscribe(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_Unsubscribe * val = NULL;

  PPCODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_Unsubscribe;
      val->CopyFrom(THIS->unsubscribe());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe", (void *)val);
      PUSHs(sv);
    }


void
set_unsubscribe(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    ::sapo_broker::Atom_Unsubscribe * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Unsubscribe *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Unsubscribe");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_Unsubscribe * mval = THIS->mutable_unsubscribe();
      mval->CopyFrom(*VAL);
    }


I32
has_notification(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    RETVAL = THIS->has_notification();

  OUTPUT:
    RETVAL


void
clear_notification(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    THIS->clear_notification();


void
notification(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_Notification * val = NULL;

  PPCODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_Notification;
      val->CopyFrom(THIS->notification());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification", (void *)val);
      PUSHs(sv);
    }


void
set_notification(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    ::sapo_broker::Atom_Notification * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Notification *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Notification");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_Notification * mval = THIS->mutable_notification();
      mval->CopyFrom(*VAL);
    }


I32
has_fault(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    RETVAL = THIS->has_fault();

  OUTPUT:
    RETVAL


void
clear_fault(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    THIS->clear_fault();


void
fault(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_Fault * val = NULL;

  PPCODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_Fault;
      val->CopyFrom(THIS->fault());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault", (void *)val);
      PUSHs(sv);
    }


void
set_fault(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    ::sapo_broker::Atom_Fault * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Fault *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Fault");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_Fault * mval = THIS->mutable_fault();
      mval->CopyFrom(*VAL);
    }


I32
has_ping(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    RETVAL = THIS->has_ping();

  OUTPUT:
    RETVAL


void
clear_ping(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    THIS->clear_ping();


void
ping(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_Ping * val = NULL;

  PPCODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_Ping;
      val->CopyFrom(THIS->ping());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping", (void *)val);
      PUSHs(sv);
    }


void
set_ping(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    ::sapo_broker::Atom_Ping * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Ping *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Ping");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_Ping * mval = THIS->mutable_ping();
      mval->CopyFrom(*VAL);
    }


I32
has_pong(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    RETVAL = THIS->has_pong();

  OUTPUT:
    RETVAL


void
clear_pong(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    THIS->clear_pong();


void
pong(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_Pong * val = NULL;

  PPCODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_Pong;
      val->CopyFrom(THIS->pong());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong", (void *)val);
      PUSHs(sv);
    }


void
set_pong(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    ::sapo_broker::Atom_Pong * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Pong *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Pong");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_Pong * mval = THIS->mutable_pong();
      mval->CopyFrom(*VAL);
    }


I32
has_auth(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    RETVAL = THIS->has_auth();

  OUTPUT:
    RETVAL


void
clear_auth(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    THIS->clear_auth();


void
auth(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_Authentication * val = NULL;

  PPCODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_Authentication;
      val->CopyFrom(THIS->auth());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication", (void *)val);
      PUSHs(sv);
    }


void
set_auth(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    ::sapo_broker::Atom_Authentication * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Authentication *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Authentication");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_Authentication * mval = THIS->mutable_auth();
      mval->CopyFrom(*VAL);
    }


I32
has_action_type(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    RETVAL = THIS->has_action_type();

  OUTPUT:
    RETVAL


void
clear_action_type(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    THIS->clear_action_type();


void
action_type(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;

  PPCODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      sv = sv_2mortal(newSViv(THIS->action_type()));
      PUSHs(sv);
    }


void
set_action_type(svTHIS, svVAL)
  SV * svTHIS
  IV svVAL

  CODE:
    ::sapo_broker::Atom_Action * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( ::sapo_broker::Atom_Action_ActionType_IsValid(svVAL) ) {
      THIS->set_action_type((::sapo_broker::Atom_Action_ActionType)svVAL);
    }


MODULE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom PACKAGE = SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom
PROTOTYPES: ENABLE


BOOT:
  {
    HV * stash;

    stash = gv_stashpv("SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::DestinationType", TRUE);
    newCONSTSUB(stash, "TOPIC", newSViv(::sapo_broker::Atom::TOPIC));
    newCONSTSUB(stash, "QUEUE", newSViv(::sapo_broker::Atom::QUEUE));
    newCONSTSUB(stash, "VIRTUAL_QUEUE", newSViv(::sapo_broker::Atom::VIRTUAL_QUEUE));
  }


SV *
::sapo_broker::Atom::new (...)
  PREINIT:
    ::sapo_broker::Atom * rv = NULL;

  CODE:
    if ( strcmp(CLASS,"SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      croak("invalid class %s",CLASS);
    }
    if ( items == 2 && ST(1) != Nullsv ) {
      if ( SvROK(ST(1)) && SvTYPE(SvRV(ST(1))) == SVt_PVHV ) {
        rv = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_from_hashref(ST(1));
      } else {
        STRLEN len;
        char * str;

        rv = new ::sapo_broker::Atom;
        str = SvPV(ST(1), len);
        if ( str != NULL ) {
          rv->ParseFromArray(str, len);
        }
      }
    } else {
      rv = new ::sapo_broker::Atom;
    }
    RETVAL = newSV(0);
    sv_setref_pv(RETVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom", (void *)rv);

  OUTPUT:
    RETVAL


void
DESTROY(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL ) {
      delete THIS;
    }


void
copy_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);

        THIS->CopyFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_from_hashref(sv);
        THIS->CopyFrom(*other);
        delete other;
      }
    }


void
merge_from(svTHIS, sv)
  SV * svTHIS
  SV * sv
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL && sv != NULL ) {
      if ( sv_derived_from(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
        IV tmp = SvIV((SV *)SvRV(sv));
        ::sapo_broker::Atom * other = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);

        THIS->MergeFrom(*other);
      } else if ( SvROK(sv) &&
                  SvTYPE(SvRV(sv)) == SVt_PVHV ) {
        ::sapo_broker::Atom * other = __SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_from_hashref(sv);
        THIS->MergeFrom(*other);
        delete other;
      }
    }


void
clear(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL ) {
      THIS->Clear();
    }


int
is_initialized(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->IsInitialized();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
error_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string estr;

  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL ) {
      estr = THIS->InitializationErrorString();
    }
    RETVAL = newSVpv(estr.c_str(), estr.length());

  OUTPUT:
    RETVAL


void
discard_unkown_fields(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL ) {
      THIS->DiscardUnknownFields();
    }


SV *
debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL ) {
      dstr = THIS->DebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


SV *
short_debug_string(svTHIS)
  SV * svTHIS
  PREINIT:
    string dstr;

  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL ) {
      dstr = THIS->ShortDebugString();
    }
    RETVAL = newSVpv(dstr.c_str(), dstr.length());

  OUTPUT:
    RETVAL


int
unpack(svTHIS, arg)
  SV * svTHIS
  SV * arg
  PREINIT:
    STRLEN len;
    char * str;

  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL ) {
      str = SvPV(arg, len);
      if ( str != NULL ) {
        RETVAL = THIS->ParseFromArray(str, len);
      } else {
        RETVAL = 0;
      }
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


SV *
pack(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL ) {
      RETVAL = newSVpvn("", 0);
      broker_OutputStream os(RETVAL);
      if ( THIS->IsInitialized() ) {
        if ( THIS->SerializePartialToZeroCopyStream(&os)!= true ) {
          SvREFCNT_dec(RETVAL);
          RETVAL = Nullsv;
        } else {
          os.Sync();
        }
      } else {
        croak("Can't serialize message of type 'SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom' because it is missing required fields: %s",
              THIS->InitializationErrorString().c_str());
      }
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


int
length(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL ) {
      RETVAL = THIS->ByteSize();
    } else {
      RETVAL = 0;
    }

  OUTPUT:
    RETVAL


void
fields(svTHIS)
  SV * svTHIS
  PPCODE:
    (void)svTHIS;
    EXTEND(SP, 2);
    PUSHs(sv_2mortal(newSVpv("header",0)));
    PUSHs(sv_2mortal(newSVpv("action",0)));


SV *
to_hashref(svTHIS)
  SV * svTHIS
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL ) {
      HV * hv0 = newHV();
      ::sapo_broker::Atom * msg0 = THIS;

      if ( msg0->has_header() ) {
        ::sapo_broker::Atom_Header * msg2 = msg0->mutable_header();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->parameter_size() > 0 ) {
          AV * av2 = newAV();
          SV * sv2 = newRV_noinc((SV *)av2);
          
          for ( int i2 = 0; i2 < msg2->parameter_size(); i2++ ) {
            ::sapo_broker::Atom_Parameter * msg4 = msg2->mutable_parameter(i2);
            HV * hv4 = newHV();
            SV * sv3 = newRV_noinc((SV *)hv4);
            
            if ( msg4->has_name() ) {
              SV * sv4 = newSVpv(msg4->name().c_str(), msg4->name().length());
              hv_store(hv4, "name", sizeof("name") - 1, sv4, 0);
            }
            if ( msg4->has_value() ) {
              SV * sv4 = newSVpv(msg4->value().c_str(), msg4->value().length());
              hv_store(hv4, "value", sizeof("value") - 1, sv4, 0);
            }
            av_push(av2, sv3);
          }
          hv_store(hv2, "parameter", sizeof("parameter") - 1, sv2, 0);
        }
        hv_store(hv0, "header", sizeof("header") - 1, sv1, 0);
      }
      if ( msg0->has_action() ) {
        ::sapo_broker::Atom_Action * msg2 = msg0->mutable_action();
        HV * hv2 = newHV();
        SV * sv1 = newRV_noinc((SV *)hv2);
        
        if ( msg2->has_publish() ) {
          ::sapo_broker::Atom_Publish * msg4 = msg2->mutable_publish();
          HV * hv4 = newHV();
          SV * sv3 = newRV_noinc((SV *)hv4);
          
          if ( msg4->has_action_id() ) {
            SV * sv4 = newSVpv(msg4->action_id().c_str(), msg4->action_id().length());
            hv_store(hv4, "action_id", sizeof("action_id") - 1, sv4, 0);
          }
          if ( msg4->has_destination_type() ) {
            SV * sv4 = newSViv(msg4->destination_type());
            hv_store(hv4, "destination_type", sizeof("destination_type") - 1, sv4, 0);
          }
          if ( msg4->has_destination() ) {
            SV * sv4 = newSVpv(msg4->destination().c_str(), msg4->destination().length());
            hv_store(hv4, "destination", sizeof("destination") - 1, sv4, 0);
          }
          if ( msg4->has_message() ) {
            ::sapo_broker::Atom_BrokerMessage * msg6 = msg4->mutable_message();
            HV * hv6 = newHV();
            SV * sv5 = newRV_noinc((SV *)hv6);
            
            if ( msg6->has_message_id() ) {
              SV * sv6 = newSVpv(msg6->message_id().c_str(), msg6->message_id().length());
              hv_store(hv6, "message_id", sizeof("message_id") - 1, sv6, 0);
            }
            if ( msg6->has_payload() ) {
              SV * sv6 = newSVpv(msg6->payload().c_str(), msg6->payload().length());
              hv_store(hv6, "payload", sizeof("payload") - 1, sv6, 0);
            }
            if ( msg6->has_expiration() ) {
              ostringstream ost6;
              
              ost6 << msg6->expiration();
              SV * sv6 = newSVpv(ost6.str().c_str(), ost6.str().length());
              hv_store(hv6, "expiration", sizeof("expiration") - 1, sv6, 0);
            }
            if ( msg6->has_timestamp() ) {
              ostringstream ost6;
              
              ost6 << msg6->timestamp();
              SV * sv6 = newSVpv(ost6.str().c_str(), ost6.str().length());
              hv_store(hv6, "timestamp", sizeof("timestamp") - 1, sv6, 0);
            }
            hv_store(hv4, "message", sizeof("message") - 1, sv5, 0);
          }
          hv_store(hv2, "publish", sizeof("publish") - 1, sv3, 0);
        }
        if ( msg2->has_poll() ) {
          ::sapo_broker::Atom_Poll * msg4 = msg2->mutable_poll();
          HV * hv4 = newHV();
          SV * sv3 = newRV_noinc((SV *)hv4);
          
          if ( msg4->has_action_id() ) {
            SV * sv4 = newSVpv(msg4->action_id().c_str(), msg4->action_id().length());
            hv_store(hv4, "action_id", sizeof("action_id") - 1, sv4, 0);
          }
          if ( msg4->has_destination() ) {
            SV * sv4 = newSVpv(msg4->destination().c_str(), msg4->destination().length());
            hv_store(hv4, "destination", sizeof("destination") - 1, sv4, 0);
          }
          if ( msg4->has_timeout() ) {
            ostringstream ost4;
            
            ost4 << msg4->timeout();
            SV * sv4 = newSVpv(ost4.str().c_str(), ost4.str().length());
            hv_store(hv4, "timeout", sizeof("timeout") - 1, sv4, 0);
          }
          hv_store(hv2, "poll", sizeof("poll") - 1, sv3, 0);
        }
        if ( msg2->has_accepted() ) {
          ::sapo_broker::Atom_Accepted * msg4 = msg2->mutable_accepted();
          HV * hv4 = newHV();
          SV * sv3 = newRV_noinc((SV *)hv4);
          
          if ( msg4->has_action_id() ) {
            SV * sv4 = newSVpv(msg4->action_id().c_str(), msg4->action_id().length());
            hv_store(hv4, "action_id", sizeof("action_id") - 1, sv4, 0);
          }
          hv_store(hv2, "accepted", sizeof("accepted") - 1, sv3, 0);
        }
        if ( msg2->has_ack_message() ) {
          ::sapo_broker::Atom_AcknowledgeMessage * msg4 = msg2->mutable_ack_message();
          HV * hv4 = newHV();
          SV * sv3 = newRV_noinc((SV *)hv4);
          
          if ( msg4->has_action_id() ) {
            SV * sv4 = newSVpv(msg4->action_id().c_str(), msg4->action_id().length());
            hv_store(hv4, "action_id", sizeof("action_id") - 1, sv4, 0);
          }
          if ( msg4->has_message_id() ) {
            SV * sv4 = newSVpv(msg4->message_id().c_str(), msg4->message_id().length());
            hv_store(hv4, "message_id", sizeof("message_id") - 1, sv4, 0);
          }
          if ( msg4->has_destination() ) {
            SV * sv4 = newSVpv(msg4->destination().c_str(), msg4->destination().length());
            hv_store(hv4, "destination", sizeof("destination") - 1, sv4, 0);
          }
          hv_store(hv2, "ack_message", sizeof("ack_message") - 1, sv3, 0);
        }
        if ( msg2->has_subscribe() ) {
          ::sapo_broker::Atom_Subscribe * msg4 = msg2->mutable_subscribe();
          HV * hv4 = newHV();
          SV * sv3 = newRV_noinc((SV *)hv4);
          
          if ( msg4->has_action_id() ) {
            SV * sv4 = newSVpv(msg4->action_id().c_str(), msg4->action_id().length());
            hv_store(hv4, "action_id", sizeof("action_id") - 1, sv4, 0);
          }
          if ( msg4->has_destination() ) {
            SV * sv4 = newSVpv(msg4->destination().c_str(), msg4->destination().length());
            hv_store(hv4, "destination", sizeof("destination") - 1, sv4, 0);
          }
          if ( msg4->has_destination_type() ) {
            SV * sv4 = newSViv(msg4->destination_type());
            hv_store(hv4, "destination_type", sizeof("destination_type") - 1, sv4, 0);
          }
          hv_store(hv2, "subscribe", sizeof("subscribe") - 1, sv3, 0);
        }
        if ( msg2->has_unsubscribe() ) {
          ::sapo_broker::Atom_Unsubscribe * msg4 = msg2->mutable_unsubscribe();
          HV * hv4 = newHV();
          SV * sv3 = newRV_noinc((SV *)hv4);
          
          if ( msg4->has_action_id() ) {
            SV * sv4 = newSVpv(msg4->action_id().c_str(), msg4->action_id().length());
            hv_store(hv4, "action_id", sizeof("action_id") - 1, sv4, 0);
          }
          if ( msg4->has_destination() ) {
            SV * sv4 = newSVpv(msg4->destination().c_str(), msg4->destination().length());
            hv_store(hv4, "destination", sizeof("destination") - 1, sv4, 0);
          }
          if ( msg4->has_destination_type() ) {
            SV * sv4 = newSViv(msg4->destination_type());
            hv_store(hv4, "destination_type", sizeof("destination_type") - 1, sv4, 0);
          }
          hv_store(hv2, "unsubscribe", sizeof("unsubscribe") - 1, sv3, 0);
        }
        if ( msg2->has_notification() ) {
          ::sapo_broker::Atom_Notification * msg4 = msg2->mutable_notification();
          HV * hv4 = newHV();
          SV * sv3 = newRV_noinc((SV *)hv4);
          
          if ( msg4->has_destination() ) {
            SV * sv4 = newSVpv(msg4->destination().c_str(), msg4->destination().length());
            hv_store(hv4, "destination", sizeof("destination") - 1, sv4, 0);
          }
          if ( msg4->has_subscription() ) {
            SV * sv4 = newSVpv(msg4->subscription().c_str(), msg4->subscription().length());
            hv_store(hv4, "subscription", sizeof("subscription") - 1, sv4, 0);
          }
          if ( msg4->has_destination_type() ) {
            SV * sv4 = newSViv(msg4->destination_type());
            hv_store(hv4, "destination_type", sizeof("destination_type") - 1, sv4, 0);
          }
          if ( msg4->has_message() ) {
            ::sapo_broker::Atom_BrokerMessage * msg6 = msg4->mutable_message();
            HV * hv6 = newHV();
            SV * sv5 = newRV_noinc((SV *)hv6);
            
            if ( msg6->has_message_id() ) {
              SV * sv6 = newSVpv(msg6->message_id().c_str(), msg6->message_id().length());
              hv_store(hv6, "message_id", sizeof("message_id") - 1, sv6, 0);
            }
            if ( msg6->has_payload() ) {
              SV * sv6 = newSVpv(msg6->payload().c_str(), msg6->payload().length());
              hv_store(hv6, "payload", sizeof("payload") - 1, sv6, 0);
            }
            if ( msg6->has_expiration() ) {
              ostringstream ost6;
              
              ost6 << msg6->expiration();
              SV * sv6 = newSVpv(ost6.str().c_str(), ost6.str().length());
              hv_store(hv6, "expiration", sizeof("expiration") - 1, sv6, 0);
            }
            if ( msg6->has_timestamp() ) {
              ostringstream ost6;
              
              ost6 << msg6->timestamp();
              SV * sv6 = newSVpv(ost6.str().c_str(), ost6.str().length());
              hv_store(hv6, "timestamp", sizeof("timestamp") - 1, sv6, 0);
            }
            hv_store(hv4, "message", sizeof("message") - 1, sv5, 0);
          }
          hv_store(hv2, "notification", sizeof("notification") - 1, sv3, 0);
        }
        if ( msg2->has_fault() ) {
          ::sapo_broker::Atom_Fault * msg4 = msg2->mutable_fault();
          HV * hv4 = newHV();
          SV * sv3 = newRV_noinc((SV *)hv4);
          
          if ( msg4->has_action_id() ) {
            SV * sv4 = newSVpv(msg4->action_id().c_str(), msg4->action_id().length());
            hv_store(hv4, "action_id", sizeof("action_id") - 1, sv4, 0);
          }
          if ( msg4->has_fault_code() ) {
            SV * sv4 = newSVpv(msg4->fault_code().c_str(), msg4->fault_code().length());
            hv_store(hv4, "fault_code", sizeof("fault_code") - 1, sv4, 0);
          }
          if ( msg4->has_fault_message() ) {
            SV * sv4 = newSVpv(msg4->fault_message().c_str(), msg4->fault_message().length());
            hv_store(hv4, "fault_message", sizeof("fault_message") - 1, sv4, 0);
          }
          if ( msg4->has_fault_detail() ) {
            SV * sv4 = newSVpv(msg4->fault_detail().c_str(), msg4->fault_detail().length());
            hv_store(hv4, "fault_detail", sizeof("fault_detail") - 1, sv4, 0);
          }
          hv_store(hv2, "fault", sizeof("fault") - 1, sv3, 0);
        }
        if ( msg2->has_ping() ) {
          ::sapo_broker::Atom_Ping * msg4 = msg2->mutable_ping();
          HV * hv4 = newHV();
          SV * sv3 = newRV_noinc((SV *)hv4);
          
          if ( msg4->has_action_id() ) {
            SV * sv4 = newSVpv(msg4->action_id().c_str(), msg4->action_id().length());
            hv_store(hv4, "action_id", sizeof("action_id") - 1, sv4, 0);
          }
          hv_store(hv2, "ping", sizeof("ping") - 1, sv3, 0);
        }
        if ( msg2->has_pong() ) {
          ::sapo_broker::Atom_Pong * msg4 = msg2->mutable_pong();
          HV * hv4 = newHV();
          SV * sv3 = newRV_noinc((SV *)hv4);
          
          if ( msg4->has_action_id() ) {
            SV * sv4 = newSVpv(msg4->action_id().c_str(), msg4->action_id().length());
            hv_store(hv4, "action_id", sizeof("action_id") - 1, sv4, 0);
          }
          hv_store(hv2, "pong", sizeof("pong") - 1, sv3, 0);
        }
        if ( msg2->has_auth() ) {
          ::sapo_broker::Atom_Authentication * msg4 = msg2->mutable_auth();
          HV * hv4 = newHV();
          SV * sv3 = newRV_noinc((SV *)hv4);
          
          if ( msg4->has_action_id() ) {
            SV * sv4 = newSVpv(msg4->action_id().c_str(), msg4->action_id().length());
            hv_store(hv4, "action_id", sizeof("action_id") - 1, sv4, 0);
          }
          if ( msg4->has_authentication_type() ) {
            SV * sv4 = newSVpv(msg4->authentication_type().c_str(), msg4->authentication_type().length());
            hv_store(hv4, "authentication_type", sizeof("authentication_type") - 1, sv4, 0);
          }
          if ( msg4->has_token() ) {
            SV * sv4 = newSVpv(msg4->token().c_str(), msg4->token().length());
            hv_store(hv4, "token", sizeof("token") - 1, sv4, 0);
          }
          if ( msg4->has_user_id() ) {
            SV * sv4 = newSVpv(msg4->user_id().c_str(), msg4->user_id().length());
            hv_store(hv4, "user_id", sizeof("user_id") - 1, sv4, 0);
          }
          if ( msg4->role_size() > 0 ) {
            AV * av4 = newAV();
            SV * sv4 = newRV_noinc((SV *)av4);
            
            for ( int i4 = 0; i4 < msg4->role_size(); i4++ ) {
              SV * sv5 = newSVpv(msg4->role(i4).c_str(), msg4->role(i4).length());
              av_push(av4, sv5);
            }
            hv_store(hv4, "role", sizeof("role") - 1, sv4, 0);
          }
          hv_store(hv2, "auth", sizeof("auth") - 1, sv3, 0);
        }
        if ( msg2->has_action_type() ) {
          SV * sv2 = newSViv(msg2->action_type());
          hv_store(hv2, "action_type", sizeof("action_type") - 1, sv2, 0);
        }
        hv_store(hv0, "action", sizeof("action") - 1, sv1, 0);
      }
      RETVAL = newRV_noinc((SV *)hv0);
    } else {
      RETVAL = Nullsv;
    }

  OUTPUT:
    RETVAL


I32
has_header(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    RETVAL = THIS->has_header();

  OUTPUT:
    RETVAL


void
clear_header(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    THIS->clear_header();


void
header(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_Header * val = NULL;

  PPCODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_Header;
      val->CopyFrom(THIS->header());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header", (void *)val);
      PUSHs(sv);
    }


void
set_header(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    ::sapo_broker::Atom_Header * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Header *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Header");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_Header * mval = THIS->mutable_header();
      mval->CopyFrom(*VAL);
    }


I32
has_action(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    RETVAL = THIS->has_action();

  OUTPUT:
    RETVAL


void
clear_action(svTHIS)
  SV * svTHIS;
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    THIS->clear_action();


void
action(svTHIS)
  SV * svTHIS;
PREINIT:
    SV * sv;
    ::sapo_broker::Atom_Action * val = NULL;

  PPCODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    if ( THIS != NULL ) {
      EXTEND(SP,1);
      val = new ::sapo_broker::Atom_Action;
      val->CopyFrom(THIS->action());
      sv = sv_newmortal();
      sv_setref_pv(sv, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action", (void *)val);
      PUSHs(sv);
    }


void
set_action(svTHIS, svVAL)
  SV * svTHIS
  SV * svVAL
  CODE:
    ::sapo_broker::Atom * THIS;
    if ( sv_derived_from(svTHIS, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom") ) {
      IV tmp = SvIV((SV *)SvRV(svTHIS));
      THIS = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom *, tmp);
    } else {
      croak("THIS is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom");
    }
    ::sapo_broker::Atom_Action * VAL;
    if ( sv_derived_from(svVAL, "SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action") ) {
      IV tmp = SvIV((SV *)SvRV(svVAL));
      VAL = INT2PTR(__SAPO__Broker__Codecs__Autogen__ProtobufXS__Atom_Action *, tmp);
    } else {
      croak("VAL is not of type SAPO::Broker::Codecs::Autogen::ProtobufXS::Atom::Action");
    }
    if ( VAL != NULL ) {
      ::sapo_broker::Atom_Action * mval = THIS->mutable_action();
      mval->CopyFrom(*VAL);
    }


