//
// This file is part of an OMNeT++/OMNEST simulation example.
//
// Copyright (C) 1992-2008 Andras Varga
//
// This file is distributed WITHOUT ANY WARRANTY. See the file
// `license' for details on this and other legal matters.
//

package omnetcan.node;

//
// Application model to generate traffic for the network.
//
simple App like IApp
{
    parameters:
        int address;  // local node address
        string destAddresses;  // destination addresses
        volatile double sendIaTime @unit(s) = default(exponential(1s)); // time between generating packets
        volatile int packetLength @unit(byte);  // length of one message (fixed! no "volatile" modifier)
        @display("i=block/browser");
        @signal[endToEndDelay](type="simtime_t");
        @signal[hopCount](type="int");
        @signal[sourceAddress](type="int");
        @statistic[endToEndDelay](title="end-to-end delay of arrived packets";unit=s;interpolationmode=none);
        @statistic[hopCount](title="hop count of arrived packets";interpolationmode=none);
        @statistic[sourceAddress](title="source address of arrived packets";interpolationmode=none);
    gates:
        input in;
        output out;
}

