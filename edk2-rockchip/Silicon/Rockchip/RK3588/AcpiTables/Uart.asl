/** @file
 *
 *  [DSDT] Serial devices (UART).
 *
 *  Copyright (c) 2021, ARM Limited. All rights reserved.
 *  Copyright (c) 2020, Pete Batard <pete@akeo.ie>
 *  Copyright (c) 2018, Andrey Warkentin <andrey.warkentin@gmail.com>
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *
 *  SPDX-License-Identifier: BSD-2-Clause-Patent
 *
 **/

#include "AcpiTables.h"

Device(UAR2) {
  Name (_HID, "HISI0031")
  Name (_UID, 2)
  Name (_CRS, ResourceTemplate() {
    Memory32Fixed(ReadWrite, 0xfeb50000, 0x1000)
    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive) { 365 }
  })

  Name (_DSD, Package () {
    ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
    Package () {
      Package () { "reg-shift", 2 },
      Package () { "reg-io-width", 4 },
      Package () { "clock-frequency", 24000000 },
    }
  })

  Method (_STA, 0, NotSerialized) {
    Return(0x0F)
  }
}

Device (TPM2)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "FTPM0101")  // _HID: Hardware ID
            Name (_CID, "MSFT0101" /* TPM 2.0 Security Device */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_DDN, "Microsoft TPM 2.0")  // _DDN: DOS Device Name
            Name (_STR, Unicode ("Microsoft TPM 2.0"))  // _STR: Description String
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                })
                Return (RBUF) /* \_SB_.TPM2._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        //
        // Description: Microsoft FTPM Simulator
        //
        Device (FSIM)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "MPTF8888")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_DDN, "Microsoft fTPM Simulator")  // _DDN: DOS Device Name
            Name (_STR, Unicode ("Microsoft fTPM Simulator"))  // _STR: Description String
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                })
                Return (RBUF) /* \_SB_.FSIM._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }
