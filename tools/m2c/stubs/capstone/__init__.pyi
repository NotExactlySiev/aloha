# Minimal stubs for Capstone

from typing import Any, Iterator, List, Optional

ppc: Any = ...

_CsMnemonic = int
_CsRegister = int

CS_ARCH_PPC: int = ...
CS_MODE_32: int = ...
CS_MODE_BIG_ENDIAN: int = ...

class CsInsn:
    def __init__(self, cs: Any, all_info: Any) -> None: ...
    @property
    def id(self) -> _CsMnemonic: ...
    @property
    def address(self) -> int: ...
    @property
    def bytes(self) -> bytes: ...
    @property
    def mnemonic(self) -> str: ...
    @property
    def op_str(self) -> str: ...
    @property
    def operands(self) -> List[Any]: ...
    def reg_name(self, reg_id: _CsRegister, default: Optional[str] = ...) -> str: ...

class Cs:
    detail: bool
    imm_unsigned: bool
    def __init__(self, arch: int, mode: int) -> None: ...
    def disasm(self, data: bytes, base_address: int) -> Iterator[CsInsn]: ...
