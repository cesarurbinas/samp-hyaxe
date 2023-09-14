#if defined LOGGER_H
	#endinput
#endif

#define LOGGER_H

#define _LOGGER_DETECT_PARAMS:%0) %0,"")
#define _LOGGER_MODIFY_FUNC:%0(%2,_:_LOGGER_DETECT_PARAMS:%1) %0(%2,_:_LOGGER_DETECT_PARAMS:%1,"")

#define _LOGGER_TYPE(%0) _:_LOGGER_TYPE_ERROR:_LOGGER_TYPE_WARNING:_LOGGER_TYPE_INFO:_LOGGER_TYPE_DEBUG(%0)
#define _LOGGER_TYPE_ERROR:_LOGGER_TYPE_WARNING:_LOGGER_TYPE_INFO:_LOGGER_TYPE_DEBUG(%0,%2_ERROR,%1) "(ERROR - %s: %d) " %0, __file[7], __line, %1), SendRconCommand("exit")
#define _LOGGER_TYPE_WARNING:_LOGGER_TYPE_INFO:_LOGGER_TYPE_DEBUG(%0,%2_WARNING,%1) "(ADVERTENCIA - %s: %d) " %0, __file[7], __line, %1)
#define _LOGGER_TYPE_INFO:_LOGGER_TYPE_DEBUG(%0,%2_INFO,%1) "(INFORMACIÓN) " %0, %1)

#if DEBUG_MODE == 0
	#define Logger_Debug(%0);
#elseif DEBUG_MODE == 1
	#define _LOGGER_TYPE_DEBUG(%0,%2_DEBUG,%1) "(DEBUG - %02d:%02d:%02d) " %0, (gettime(g_iLoggingHour, g_iLoggingMinute, g_iLoggingSecond), g_iLoggingHour), g_iLoggingMinute, g_iLoggingSecond, %1)
	#define Logger_Debug(%0) _LOGGER_MODIFY_FUNC:_LOGGER_PROCESS(0_DEBUG,_:_LOGGER_DETECT_PARAMS:%0)
#elseif DEBUG_MODE == 2
	#define _LOGGER_TYPE_DEBUG(%0,%2_DEBUG,%1) "(DEBUG - %02d:%02d:%02d) " %0, (gettime(g_iLoggingHour, g_iLoggingMinute, g_iLoggingSecond), g_iLoggingHour), g_iLoggingMinute, g_iLoggingSecond, %1), Chat_SendMessageToAll("{E7E7E7}[{DD7631}DEBUG - %02d:%02d:%02d{E7E7E7}] " %0, g_iLoggingHour, g_iLoggingMinute, g_iLoggingSecond, %1)
	#define Logger_Debug(%0) _LOGGER_MODIFY_FUNC:_LOGGER_PROCESS(0_DEBUG,_:_LOGGER_DETECT_PARAMS:%0)
#endif

#define _LOGGER_PROCESS(%2,_:%0,%1) printf(_LOGGER_TYPE(%0,%2,%1)

#define Logger_Error(%0) _LOGGER_MODIFY_FUNC:_LOGGER_PROCESS(0_ERROR,_:_LOGGER_DETECT_PARAMS:%0)
#define Logger_Warning(%0) _LOGGER_MODIFY_FUNC:_LOGGER_PROCESS(0_WARNING,_:_LOGGER_DETECT_PARAMS:%0)
#define Logger_Info(%0) _LOGGER_MODIFY_FUNC:_LOGGER_PROCESS(0_INFO,_:_LOGGER_DETECT_PARAMS:%0)

new stock
	g_iLoggingHour,
	g_iLoggingMinute,
	g_iLoggingSecond;