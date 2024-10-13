// Generated by gencpp from file styx_msgs/EStop.msg
// DO NOT EDIT!


#ifndef STYX_MSGS_MESSAGE_ESTOP_H
#define STYX_MSGS_MESSAGE_ESTOP_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace styx_msgs
{
template <class ContainerAllocator>
struct EStop_
{
  typedef EStop_<ContainerAllocator> Type;

  EStop_()
    : EStop(false)  {
    }
  EStop_(const ContainerAllocator& _alloc)
    : EStop(false)  {
  (void)_alloc;
    }



   typedef uint8_t _EStop_type;
  _EStop_type EStop;





  typedef boost::shared_ptr< ::styx_msgs::EStop_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::styx_msgs::EStop_<ContainerAllocator> const> ConstPtr;

}; // struct EStop_

typedef ::styx_msgs::EStop_<std::allocator<void> > EStop;

typedef boost::shared_ptr< ::styx_msgs::EStop > EStopPtr;
typedef boost::shared_ptr< ::styx_msgs::EStop const> EStopConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::styx_msgs::EStop_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::styx_msgs::EStop_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::styx_msgs::EStop_<ContainerAllocator1> & lhs, const ::styx_msgs::EStop_<ContainerAllocator2> & rhs)
{
  return lhs.EStop == rhs.EStop;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::styx_msgs::EStop_<ContainerAllocator1> & lhs, const ::styx_msgs::EStop_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace styx_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::styx_msgs::EStop_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::styx_msgs::EStop_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::styx_msgs::EStop_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::styx_msgs::EStop_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::styx_msgs::EStop_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::styx_msgs::EStop_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::styx_msgs::EStop_<ContainerAllocator> >
{
  static const char* value()
  {
    return "15c187ac41fba10560c992ebbf27db9f";
  }

  static const char* value(const ::styx_msgs::EStop_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x15c187ac41fba105ULL;
  static const uint64_t static_value2 = 0x60c992ebbf27db9fULL;
};

template<class ContainerAllocator>
struct DataType< ::styx_msgs::EStop_<ContainerAllocator> >
{
  static const char* value()
  {
    return "styx_msgs/EStop";
  }

  static const char* value(const ::styx_msgs::EStop_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::styx_msgs::EStop_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool EStop\n"
;
  }

  static const char* value(const ::styx_msgs::EStop_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::styx_msgs::EStop_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.EStop);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct EStop_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::styx_msgs::EStop_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::styx_msgs::EStop_<ContainerAllocator>& v)
  {
    s << indent << "EStop: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.EStop);
  }
};

} // namespace message_operations
} // namespace ros

#endif // STYX_MSGS_MESSAGE_ESTOP_H
