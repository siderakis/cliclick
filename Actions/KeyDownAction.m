/**
 * Copyright (c) 2007-2013, Carsten Blüm <carsten@bluem.net>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 * - Neither the name of Carsten Blüm nor the names of his contributors may be
 *   used to endorse or promote products derived from this software without specific
 *   prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "KeyDownAction.h"

@implementation KeyDownAction

+(NSString *)commandListShortcut {
    return @"kd";
}

+(NSString *)commandDescription {
    return @"  kd:keys Will trigger a KEY DOWN event for a comma-separated list of\n"
    "          modifier keys (“cmd”, “alt” or “ctrl”).\n"
    "          Example: “kd:cmd,alt” will press the command key and the\n"
    "          option key (and will keep them down until you release them\n"
    "          with another command)";
}

-(void)performActionWithKeycode:(CGKeyCode)code {
    CGEventRef e = CGEventCreateKeyboardEvent(NULL, code, true);
    CGEventPost(kCGSessionEventTap, e);
}

-(NSString *)actionDescriptionString:(NSString *)keyName {
    return [NSString stringWithFormat:@"Press %@ key", keyName];
}

@end
