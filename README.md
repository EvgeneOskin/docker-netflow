Project Goals:
1. A testing environment for generating and working with NetFlows

Run:
```
# Build and start
docker build -t netflow .
docker rm test
docker run -d --name test netflow

# Generate some data
docker exec test apt-get update
docker exec test softflowctl expire-all

# Wait for nfcapd to dump
sleep 120
docker exec test nfdump -R /flows
```

Output:
```
Date first seen          Duration Proto      Src IP Addr:Port          Dst IP Addr:Port   Packets    Bytes Flows
2016-10-24 16:06:43.373     0.000 ICMP6               ::.0     -> ff02::1..79:de19.0.0          1       64     1
2016-10-24 16:06:43.435     0.000 ICMP6               ::.0     ->         ff02::16.0.0          1       76     1
2016-10-24 16:06:43.984     0.000 ICMP6               ::.0     ->   ff02::1:ff11:2.0.0          1       64     1
2016-10-24 16:06:44.375     0.419 ICMP6 fe80::c..79:de19.0     ->         ff02::16.0.0          2      152     1
2016-10-24 16:06:44.984     1.005 ICMP6 fe80::4..:fe11:2.0     ->         ff02::16.0.0          2      152     1
2016-10-24 16:06:44.375     8.051 ICMP6 fe80::c..79:de19.0     ->          ff02::2.0.0          3      168     1
2016-10-24 16:06:44.984     8.022 ICMP6 fe80::4..:fe11:2.0     ->          ff02::2.0.0          3      168     1
2016-10-24 16:07:17.414     0.014 UDP         172.17.0.2:41608 ->     192.168.65.1:53           2      128     1
2016-10-24 16:07:17.414     0.014 UDP       192.168.65.1:53    ->       172.17.0.2:41608        2      304     1
2016-10-24 16:07:17.428     1.335 TCP      91.189.88.152:80    ->       172.17.0.2:40528      752    1.1 M     1
2016-10-24 16:07:17.428     1.335 TCP         172.17.0.2:40528 ->    91.189.88.152:80         535    22568     1
Summary: total flows: 11, total bytes: 1104477, total packets: 1304, avg bps: 249669, avg pps: 36, avg bpp: 846
Time window: 2016-10-24 16:06:43 - 2016-10-24 16:10:43
Total flows processed: 11, Blocks skipped: 0, Bytes read: 1320
Sys: 0.003s flows/second: 3059.0     Wall: 0.000s flows/second: 14473.7  
```
