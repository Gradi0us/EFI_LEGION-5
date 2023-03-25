/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20221020 (32-bit version)
 * Copyright (c) 2000 - 2022 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of SSDT-HPET.aml, Thu Mar 23 19:18:39 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000C2 (194)
 *     Revision         0x02
 *     Checksum         0x78
 *     OEM ID           "CORP"
 *     OEM Table ID     "HPET"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20221020 (539103264)
 */
DefinitionBlock ("", "SSDT", 2, "CORP", "HPET", 0x00000000)
{
    External (_SB_.PCI0.HPET, DeviceObj)
    External (_SB_.PCI0.HPET.XCRS, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0.HPET)
    {
        Name (BUFX, ResourceTemplate ()
        {
            IRQNoFlags ()
                {0,8,11}
            Memory32Fixed (ReadWrite,
                0xFED00000,         // Address Base
                0x00000400,         // Address Length
                )
        })
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            If ((_OSI ("Darwin") || !CondRefOf (\_SB.PCI0.HPET.XCRS)))
            {
                Return (BUFX) /* \_SB_.PCI0.HPET.BUFX */
            }

            Return (\_SB.PCI0.HPET.XCRS ())
        }
    }
}

