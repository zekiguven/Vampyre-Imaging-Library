{ $Id: CompilerOptions.inc 100 2007-06-28 21:09:52Z galfar $ }

{
  User Options
  Following defines and options can be changed by user.
  -----------------------------------------------------------------------------
}

{ If defined, debug info, range/IO/overflow checking, stack frames, assertions,
  and other debugging options will be turned on.}
{$DEFINE DEBUG}
{ Use function inlining where possible. Works in Free Pascal and Delphi 9+.}
{$DEFINE USE_INLINE}
{ If defined assembler versions of some functions will be used (only for x86).}
{$DEFINE USE_ASM}

{
  Auto Options
  Following options and defines are set automatically and some
  are required for project to compile successfully. Do not change
  anything here if you don't know what you are doing.
  -----------------------------------------------------------------------------
}

{ Compiler identification }

{$IFNDEF FPC}
  { If not using FPC then DCC compiler (Delphi/Kylix) is presumed.
    Others are not supported.}
  {$DEFINE DCC}
{$ENDIF}

{ Compiler options }

{$BOOLEVAL OFF}           // Boolean eval: off
{$EXTENDEDSYNTAX ON}      // Extended syntax: on
{$LONGSTRINGS ON}         // string = AnsiString: on
{$TYPEDADDRESS OFF}       // Typed pointers: off
{$WRITEABLECONST OFF}     // Writeable constants: off

{$IFDEF DCC}
  {$ALIGN ON}             // Field alignment: 8 Bytes (in D6+)
  {$MINENUMSIZE 1}        // Min enum size: 1 B
{$ENDIF}
{$IFDEF FPC}
  {$MODE DELPHI}          // Compatible with delphi
  {$PACKRECORDS 8}        // Same as ALING 8 for Delphi
  {$PACKENUM 1}           // Min enum size: 1 B
  {$CALLING REGISTER}     // Default calling convention is register
{$ENDIF}

{ Debug/Release compiler options }

{$IF (Defined(DCC) and (CompilerVersion >= 18.5))}
  {$IFDEF RELEASE}
    { If we are using Delphi 2007+ where you can set DEBUG/RELEASE mode
      in project options and RELEASE is currently set we undef DEBUG mode.}
    {$UNDEF DEBUG}
  {$ENDIF}
{$IFEND}

{$IFDEF DEBUG}
  {$ASSERTIONS ON}
  {$DEBUGINFO ON}

  {$RANGECHECKS ON}
  {$IOCHECKS ON}
  {$OVERFLOWCHECKS ON}
  {$STACKFRAMES ON}
  {$IFDEF DCC}
    {$OPTIMIZATION OFF}
    {$LOCALSYMBOLS ON}
    { $DEFINE MEMCHECK}
  {$ENDIF}
  {$IFDEF FPC}
    {$S+}
    {$CHECKPOINTER ON}
  {$ENDIF}
{$ELSE}
  {$ASSERTIONS OFF}
  {$DEBUGINFO OFF}
  {$RANGECHECKS OFF}
  {$IOCHECKS OFF}
  {$OVERFLOWCHECKS OFF}
  {$STACKFRAMES OFF}
  {$IFDEF DCC}
    {$OPTIMIZATION ON}
    {$LOCALSYMBOLS OFF}
  {$ENDIF}
  {$IFDEF FPC}
    {$S-}
  {$ENDIF}
{$ENDIF}

{ Compiler capabilities }

{ Define if compiler supports inlining of functions and procedures.}
{$IF (Defined(DCC) and (CompilerVersion >= 17)) or (Defined(FPC) and Defined(CPU86))}
  {$DEFINE HAS_INLINE}
{$IFEND}

{ Define if compiler supports advanced records with methods.}
{$IF (Defined(DCC) and (CompilerVersion >= 18)) }
  {$DEFINE HAS_ADVANCED_RECORDS}
{$IFEND}

{ Define if compiler supports operator overloading
 (unfortunately Delphi and FPC operator overloaing is not compatible now).}
{$IF (Defined(DCC) and (CompilerVersion >= 18)) or Defined(FPC)}
  {$DEFINE HAS_OPERATOR_OVERLOADING}
  {$IFDEF DCC}
    {$DEFINE HAS_OPERATOR_OVERLOADING_DCC}
  {$ELSE}
    {$DEFINE HAS_OPERATOR_OVERLOADING_FPC}
  {$ENDIF}
{$IFEND}

{ Compiler options based on compiler capabilities}

{$IFDEF HAS_INLINE}
  {$INLINE ON}            // Turns inlining on for compilers that support it
{$ENDIF}

{ User options check }

{$IFNDEF HAS_INLINE}
  {$UNDEF USE_INLINE}
{$ENDIF}

{$IFDEF FPC}
  {$IFNDEF CPU86}
    {$UNDEF USE_ASM}
  {$ENDIF}
{$ENDIF}

{ Platform options }

{$IFDEF WIN32}
  {$DEFINE MSWINDOWS}
{$ENDIF}

{$IFDEF DPMI}
  {$DEFINE MSDOS}
{$ENDIF}

{$IFDEF LINUX}
  {$DEFINE UNIX}
{$ENDIF}






