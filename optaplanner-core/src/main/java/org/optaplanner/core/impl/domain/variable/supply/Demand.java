/*
 * Copyright 2014 JBoss Inc
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.optaplanner.core.impl.domain.variable.supply;

import java.io.Serializable;

/**
 * A subsystem submits a demand for a {@link Supply}.
 * Implementations must overwrite {@link #equals(Object)} and {@link #hashCode()}.
 * @param <S>
 * @see Supply
 * @see SupplyManager
 */
public interface Demand<S extends Supply> extends Serializable {

    /**
     * Only called if the domain model doesn't already support the demand (through a shadow variable usually).
     * Equal demands share the same {@link Supply}.
     * @return never null
     */
    S createExternalizedSupply();

}