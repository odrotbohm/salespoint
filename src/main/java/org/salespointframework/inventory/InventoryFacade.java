/*
 * Copyright 2019 the original author or authors.
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
package org.salespointframework.inventory;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;

import org.salespointframework.order.Order;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * Intermediate helper class to simulate a direct invocation of a command on a different bounded context.
 *
 * @author Oliver Drotbohm
 */
@Component
@RequiredArgsConstructor
public class InventoryFacade {

	private final @NonNull InventoryOrderEventListener listener;

	@Transactional
	public void updateInventoryFor(Order order) {
		listener.on(Order.OrderCompleted.of(order));
	}
}
